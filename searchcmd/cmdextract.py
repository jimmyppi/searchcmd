import re
from collections import defaultdict

from lxml import etree

from commands import Command, Commands
from download import HtmlDocument

RE_SPACE = re.compile(r'\s+', re.U+re.S)
RE_ONLY_LETTERS = re.compile('^[a-z]+$')
RE_SENTENCE_END = re.compile(r'[a-z][\.\!\?]$')

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
        # Command must start and end with lower case a-z
        #  and min number chars is two.
        base_commands = [r'[a-z][a-z0-9\-]*[a-z]']
    return re.compile(
        '^[\W]*\s*(?P<cmd>(%s)\s.+$)' % '|'.join(base_commands))


def iter_texts(html_doc):
    for line, txt in _iter_texts(html_doc.tree):
        yield line, txt


def _iter_texts(tree):
    if tree.tag == 'script' or tree.tag is etree.Comment:
        return
    line = tree.sourceline
    txts = clean_text(tree.text, tree.tag)
    if txts:
        for txt in txts:
            yield line, txt
    for child in tree.getchildren():
        for line, txt in _iter_texts(child):
            yield line, txt
    txts = clean_text(tree.tail, tree.tag)
    if txts:
        for txt in txts:
            yield line, txt


def clean_text(raw_txt, tag):
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
    if not txts:
        return []
    if tag == 'pre' or len(txts) > 2:
        return txts
    txts = [' '.join(txts)]
    return txts


def get_command(txt, rex):
    m = rex.search(txt)
    if not m:
        return
    cmd = m.group('cmd')
    if not is_command(cmd):
        return
    return cmd


def is_command(cmd_string):
    if len(cmd_string) > MAX_COMMAND_LENGTH:
        return False
    if RE_SENTENCE_END.search(cmd_string):
        return False
    only_letters = []
    others = []
    nr_consecutively_letter_words = 0
    for word in cmd_string.split():
        if RE_ONLY_LETTERS.match(word):
            nr_consecutively_letter_words += 1
            if nr_consecutively_letter_words > 2:
                return False
            only_letters.append(word)
        else:
            nr_consecutively_letter_words = 0
            others.append(word)
    if not others:# and len(only_letters) > 3:
        return False
    return True
