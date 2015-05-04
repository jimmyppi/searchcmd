import re
from collections import defaultdict

from lxml import etree

from commands import Command, Commands
from download import HtmlDocument

RE_SPACE = re.compile(r'\s+', re.U+re.S)
RE_ONLY_LETTERS = re.compile('^[a-z]+$')
RE_SENTENCE_END = re.compile(r'[a-z][\.\!\?]$')
RE_FLAG = re.compile(r'^(-){1,2}[a-z0-9]')

MAX_COMMAND_LENGTH = 200

def extract_commands(html_docs, base_commands=None):
    """Extract all commands in the html documents.

    Args:
       html_docs (HtmlDocument or iterable of docs): The html documents.
       base_commands (str or iterable of str): If provided, limit the results
         to these commands.
    Returns:
       commands (Commands): The extracted command lines.
    """
    if isinstance(html_docs, HtmlDocument):
        html_docs = [html_docs]
    if isinstance(base_commands, basestring):
        base_commands = [base_commands]
    remove_sudo = lambda cmd: cmd
    if not base_commands or not 'sudo' in base_commands:
        remove_sudo = lambda cmd: re.sub('^sudo\s+', '', cmd)
    cmdrex = get_command_rex(base_commands)
    commands = Commands()
    for doc in html_docs:
        seen = set()
        try:
            nr_cmds = 0
            for line_nr, txt in iter_texts(doc):
                cmd = get_command(txt, cmdrex)
                if cmd:
                    remove_sudo(cmd)
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

    # Only keep commands with more than one occurence
    commands_by_first_word = defaultdict(list)
    for command in commands:
        commands_by_first_word[command.cmd.split()[0]].append(command)
    keep = {}
    for cmd, coms in commands_by_first_word.iteritems():
        if len(coms) > 1 or len(coms[0].lines) > 1:
            for com in coms:
                keep[com.cmd] = com
    return Commands(keep, commands.nr_docs)


def get_command_rex(base_commands):
    # TODO: Check that the rex stops at newline
    # TODO: Document rex parts
    if not base_commands:
        # More detailed check of command word will be done in is_command
        base_commands = [r'[a-z0-9][a-z0-9\-]*']
    return re.compile(
        r'^[\$\>\:\#\%%]*\s*(?P<cmd>(%s)\s.+$)' % '|'.join(base_commands))


def iter_texts(html_doc):
    for line, txt in _iter_texts(html_doc.tree):
        yield line, txt


def _iter_texts(tree, in_pre=False):
    if tree.tag == 'script' or tree.tag is etree.Comment:
        return
    in_pre = in_pre or tree.tag == 'pre'
    line = tree.sourceline
    txts = clean_text(tree.text)
    if txts:
        if not in_pre:
            yield line, ' '.join(txts)
        else:
            for i, txt in enumerate(txts):
                yield line+i, txt
    for child in tree.getchildren():
        for line, txt in _iter_texts(child, in_pre):
            yield line, txt
    txts = clean_text(tree.tail)
    if txts:
        if not in_pre:
            yield line, ' '.join(txts)
        else:
            for i, txt in enumerate(txts):
                yield line+i, txt


def clean_text(raw_txt):
    if not raw_txt:
        return []
    txts = []
    for txt in raw_txt.split('\n'):
        txt = txt.strip()
        # We do not want output from commands
        if '\t' in txt or '   ' in txt:
            continue
        txt = RE_SPACE.sub(' ', txt)
        if txt:
            txts.append(txt)
    return txts


def get_command(txt, rex):
    m = rex.search(txt)
    if not m:
        return
    cmd = m.group('cmd')
    if not is_command(cmd):
        return
    return cmd


def is_command_word(word):
    if not word:
        return False
    if word.isdigit():
        return False
    if len(word) == 1:
        return True if re.match('[a-z]$', word) else False
    return True if re.match(r'[a-z0-9][a-z0-9\-]*[a-z0-9]$', word) else False


def is_command(cmd_string):
    if len(cmd_string) > MAX_COMMAND_LENGTH:
        return False
    if RE_SENTENCE_END.search(cmd_string):
        return False
    words = cmd_string.split()
    if not is_command_word(words[0]):
        return False
    only_letters = []
    others = []
    flags = []
    nr_consecutively_letter_words = 0
    for word in words:
        if RE_ONLY_LETTERS.match(word):
            nr_consecutively_letter_words += 1
            if nr_consecutively_letter_words > 2:
                return False
            only_letters.append(word)
        else:
            nr_consecutively_letter_words = 0
            if RE_FLAG.match(word):
                flags.append(word)
            others.append(word)
    if flags:
        return True
    if not others:
        return False
    return True
