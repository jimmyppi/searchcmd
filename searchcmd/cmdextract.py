import re
import subprocess
from collections import defaultdict

from lxml import etree

from searchcmd.commands import Command, Commands
from searchcmd.download import HtmlDocument


def list_available_commands():
    """Return list of available commands on this computer."""
    return [cmd for cmd in subprocess.check_output(
        'compgen -abc', shell=True, executable='/bin/bash').decode().split()
            if cmd and cmd[0].isalnum()]
ALL_COMMANDS = list_available_commands()


def extract_commands(html_docs, base_commands=None):
    """Extract all commands in the html documents.

    Args:
       html_docs (HtmlDocument or iterable of docs): The html documents.
       base_commands (str or iterable of str): If provided, limit the results
         to these commands.
    Returns:
       commands (Commands): Collection of found command examples.
    """
    if isinstance(html_docs, HtmlDocument):
        html_docs = [html_docs]
    extractor = CommandExtractor(base_commands)
    commands = Commands()
    for doc in html_docs:
        seen = set()
        try:
            nr_cmds = 0
            for line_nr, cmd in extractor.iter_commands(doc):
                if cmd in seen:
                    continue
                seen.add(cmd)
                commands.add_command(Command(cmd, line_nr, nr_cmds, doc))
                nr_cmds += 1
            commands.nr_docs += 1
        except:
            continue

    if base_commands:
        return commands

    # Only keep command names with more than one occurence
    commands_by_name = defaultdict(list)
    for command in commands:
        commands_by_name[command.name].append(command)
    keep = {}
    for coms in commands_by_name.values():
        if len(coms) > 1 or len(coms[0].lines) > 1:
            for com in coms:
                keep[com.cmd] = com
    return Commands(keep, commands.nr_docs)


class CommandExtractor(object):
    """Extract commands from a html document.

    Usage:

    >>> extractor = CommandExtractor('git')
    >>> for line_nr, cmd in extractor.iter_commands(html_doc)
    >>>    ...

    """
    IGNORE_TAGS = set(['style', 'head', 'script', etree.Comment])
    COMMAND_REX = re.compile((
        # The command could start with a prompt
        r'^[\$\>\:\#\%%]*\s*'
        # The command could start with sudo
        r'(?P<cmd>(sudo\s+|)'
        # Command must start with a lower case letter or a digit.
        # A more detailed check of the command will be done in is_command.
        r'[a-z0-9][a-z0-9\-]*'
        # The rest of the command that contains sub command name,
        # options and arguments.
        r'\s.+$)'))

    RE_COMMAND_NAME = re.compile((
        r'^('
        # Must be a letter if the name only contain one char
        r'[a-z]|'
        # Must start and end with letter or digit, but can contain '-'
        r'[a-z0-9][a-z0-9\-]*[a-z0-9]'
        r')$'))

    BASE_CMDS_REX = r'^(%s)\b'
    RE_ALL_COMMANDS = re.compile(BASE_CMDS_REX % '|'.join(
        map(re.escape, ALL_COMMANDS)))

    RE_SPACE = re.compile(r'\s+', re.U+re.S)
    RE_ONLY_LETTERS = re.compile('^[a-z]+$', re.I)
    RE_SENTENCE_END = re.compile(r'[a-z][\.\!\?\:]+$')
    RE_FLAG = re.compile(r'^(-){1,2}[a-z0-9]')
    RE_SUDO = re.compile(r'^sudo\s+')

    MAX_COMMAND_LENGTH = 200
    # The command must not contain more than this many consecutively
    # words that only contain letters.
    MAX_CONSECUTIVELY_LETTER_WORDS = 2

    def __init__(self, base_commands=None):
        if isinstance(base_commands, str):
            base_commands = [base_commands]
        if base_commands:
            base_commands = set(base_commands)
        if base_commands and 'sudo' in base_commands:
            self.remove_sudo = lambda cmd: cmd
        else:
            self.remove_sudo = lambda cmd: self.RE_SUDO.sub('', cmd)
        self.re_wanted_commands = self._get_wanted_rex(base_commands)

    def _get_wanted_rex(self, base_commands):
        if not base_commands:
            return self.RE_ALL_COMMANDS
        else:
            return re.compile(self.BASE_CMDS_REX % '|'.join(
                map(re.escape, base_commands)))

    def iter_commands(self, html_doc):
        """Generate commands found in the html document."""
        for line, txt in self.iter_text_lines(html_doc):
            cmd = self.get_command(txt)
            if cmd:
                yield line, cmd

    def get_command(self, txt):
        """Return command found in text or None if no command was found."""
        m = self.COMMAND_REX.search(txt)
        if not m:
            return
        cmd = m.group('cmd')
        cmd = self.remove_sudo(cmd)
        if not self.is_command(cmd):
            return
        if not self.has_wanted_command(cmd):
            return
        return cmd

    def has_wanted_command(self, line):
        """Return True if the line contains any of the wanted commands."""
        cmds = line.split(' | ')
        for cmd in cmds:
            cmd = cmd.strip()
            if self.re_wanted_commands.search(cmd):
                return True
        return False

    def is_command_name(self, word):
        """Return True if word is a valid command name."""
        if not word:
            return False
        if word.isdigit():
            return False
        return True if self.RE_COMMAND_NAME.match(word) else False

    def is_command_output(self, line):
        """Return True if the line looks like output from a command."""
        if '\t' in line or '   ' in line:
            return True
        return False

    def is_command(self, candidate):
        """Return True if the candidate looks like a command."""
        if not candidate:
            return False
        if len(candidate) > self.MAX_COMMAND_LENGTH:
            return False
        if self.RE_SENTENCE_END.search(candidate):
            return False
        if self.is_command_output(candidate):
            return False
        words = candidate.split()
        if not self.is_command_name(words[0]):
            return False

        only_letters = []
        others = []
        flags = []
        nr_consecutively_letter_words = 0
        for word in words:
            if self.RE_ONLY_LETTERS.match(word):
                nr_consecutively_letter_words += 1
                if nr_consecutively_letter_words > \
                   self.MAX_CONSECUTIVELY_LETTER_WORDS:
                    return False
                only_letters.append(word)
            else:
                nr_consecutively_letter_words = 0
                if self.RE_FLAG.match(word):
                    flags.append(word)
                others.append(word)
        if flags:
            return True
        #if not others:
        #    return False
        return True

    def iter_text_lines(self, html_doc):
        """Generate text lines found in the html document."""
        for line, txt in self._iter_texts(html_doc.tree):
            yield line, txt

    def _iter_texts(self, tree, in_pre=False):
        """Find text snippets recursively in the html tree.

        If in a pre-tag, split on line breaks.
        If the tree is a code tag, merge all text snippets in the tree.
        """
        in_pre = in_pre or tree.tag == 'pre'

        def iter_tree_texts():
            if tree.tag == 'code':
                yield tree.sourceline, tree.text_content()
                return
            line = tree.sourceline
            if not self.skip_tree(tree):
                if tree.text:
                    yield line, tree.text
                for child in tree.getchildren():
                    for line, txt in self._iter_texts(child, in_pre):
                        yield line, txt
            if tree.tail:
                yield line, tree.tail
        txt_gen = iter_tree_texts()

        if not in_pre:
            for line, txt in txt_gen:
                txt = self.fix_space(txt)
                if txt:
                    yield line, txt
        else:
            for first_line, txt in txt_gen:
                for line, txt_line in enumerate(txt.split('\n')):
                    txt_line = txt_line.strip()
                    if txt_line:
                        yield first_line + line, txt_line

    def skip_tree(self, tree):
        if tree.tag == 'a' and tree.attrib.get('href'):
            return True
        return tree.tag in self.IGNORE_TAGS

    def fix_space(self, txt):
        return self.RE_SPACE.sub(' ', txt.strip())
