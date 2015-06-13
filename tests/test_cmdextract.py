try:
    from itertools import izip as zip
except ImportError:
    pass
from unittest import TestCase

from tests.testutils import iter_html_docs, get_html_doc
from searchcmd.download import HtmlDocument
from searchcmd.cmdextract import CommandExtractor, extract_commands

TEST_DATA_DIR = 'cmdextract'

COMMANDS = {
    'http://unixmantra.com': [
        (1254, u'find ./music -name "*.mp3" -print0 | xargs -0 ls'),
        (1258, u'find ./work -print | xargs grep "profit"'),
        (1267,
         'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts'),
        (1306, 'find . -name "*.sh" | xargs grep "ksh"'),
        (1328, 'find /tmp -name "*.tmp" | xargs rm'),
        (1335, 'find /tmp -name "*.tmp" -print0 | xargs -0 rm'),
        (1373, 'mv chap1 chap1.old'),
        (1374, 'mv chap2 chap2.old'),
        (1375, 'mv chap3 chap3.old'),
        (1385, 'ar r lib.a chap1 ?...'),
        (1386, 'ar r lib.a chap2 ?...'),
        (1387, 'ar r lib.a chap3 ?...')],
    'http://brunolinux.com': [
        (62, "sed -i 's/ugly/beautiful/g' /home/bruno/old-friends/sue.txt"),
        (91, ("find /home/bruno/old-friends -type f "
              "-exec sed -i 's/ugly/beautiful/g' {} \\;")),
        (118, u'mv $fl $fl.old'),
        (119, u"sed 's/FINDSTRING/REPLACESTRING/g' $fl.old > $fl"),
        (120, u'rm -f $fl.old'),
        (150, ('perl -e "s/old_string/new_string/g;" '
               '-pi.save $(find DirectoryName -type f)'))],
    'http://cyberciti.biz': [
        (118, 'hwclock -r'),
        (120, 'hwclock --show'),
        (122, 'hwclock --show --utc'),
        (126, 'date -s "2 OCT 2006 18:00:00"'),
        (128, 'date --set="2 OCT 2006 18:00:00"'),
        (130, 'date +%Y%m%d -s "20081128"'),
        (131, 'date +%T -s "10:13:13"'),
        (133, 'date +%T%p -s "6:10:30AM" # date +%T%p -s "12:10:30PM"'),
        (135, 'hwclock --systohc'),
        (137, 'hwclock -w'),
        (158, 'date -s 2007.04.08-22:46+0000'),
        (167, u'date -s \u201c2 OCT 2006 18:00:00\u2033'),
        (217, u'export http_proxy=\u2019http://10.10.1.2:3128\u2032'),
        (234, u'hwclock \u2013show'),
        (235, u'hwclock \u2013systohc'),
        (286, 'date +%Y%m%d -s "20080817"'),
        (354, u'date set=\u201d2 OCT 2006 18:00:00\u2033'),
        (371, u'date -s \u201d2 OCT 2006 18:00:00\u2033'),
        (380, u'date \u2013set=\u201d2 sep 2011 11:27:20\u2033'),
        (412, u'hwclock \u2013systohc'),
        (479, 'date 07252208002009'),
        (623, u'date +%Y%m%d%T -s \u201c20081225 10:05:00\u2033'),
        (704, u'date \u2013set=\u201d2 OCT 2006 18:00:00\u2033'),
        (832, 'for example 23/03/2011 to 23.03.2011'),
        (841, u'hwclock \u2013show'),
        (843, 'ls -l /etc/localtime'),
        (845, 'date 041106232011'),
        (846, u'hwclock \u2013systohc'),
        (847, 'ln -sf /usr/share/zoneinfo/ /etc/localtime'),
        (848, 'vi /etc/sysconfig/clock (update timezone if redhat)'),
        (850, u'hwclock \u2013show'),
        (852, 'ls -l /etc/localtime'),
        (929, 'date 030613252012'),
        (1126, 'uname -a'),
        (1144, u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d'),
        (1161, 'uname -a'),
        (1183, 'date --set="4 JAN 2014 13:25:00"'),
        (1239, (u'python -c \u2018import platform ; '
                u'print platform.dist()[0]\u2019')),
        (1260, u'su \u2013'),
        (1261, 'passwd root'),
        (1301, u'date +%T -s \u201c10:13:13\u2033'),
        (1310, u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d')],
    'http://stackoverflow.com': [
        (5, 'du -h --max-depth=1'),
        (24, 'du -h -s *')]
}

NR_TEXTS = {'http://unixmantra.com': 225,
            'http://brunolinux.com': 47,
            'http://cyberciti.biz': 705,
            'http://stackoverflow.com': 49}

MERGED_COMMANDS = set([
    u'find ./music -name "*.mp3" -print0 | xargs -0 ls',
    'hwclock --show',
    "sed -i 's/ugly/beautiful/g' /home/bruno/old-friends/sue.txt",
    'date --set="2 OCT 2006 18:00:00"',
    'mv chap1 chap1.old',
    u'date +%T -s \u201c10:13:13\u2033',
    'ar r lib.a chap1 ?...',
    'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts',
    u'mv $fl $fl.old',
    'mv chap2 chap2.old',
    'date 07252208002009',
    'date +%T%p -s "6:10:30AM" # date +%T%p -s "12:10:30PM"',
    'find /tmp -name "*.tmp" | xargs rm',
    'du -h --max-depth=1',
    'mv chap3 chap3.old',
    u'date \u2013set=\u201d2 sep 2011 11:27:20\u2033',
    u'date -s \u201d2 OCT 2006 18:00:00\u2033',
    'date +%Y%m%d -s "20081128"',
    'find . -name "*.sh" | xargs grep "ksh"',
    'date 041106232011',
    'ar r lib.a chap3 ?...',
    u'find ./work -print | xargs grep "profit"',
    u'date +%Y%m%d%T -s \u201c20081225 10:05:00\u2033',
    'date -s 2007.04.08-22:46+0000',
    'find /tmp -name "*.tmp" -print0 | xargs -0 rm',
    'date +%T -s "10:13:13"',
    'date --set="4 JAN 2014 13:25:00"',
    u'hwclock \u2013systohc',
    'hwclock --show --utc',
    u'date -s \u201c2 OCT 2006 18:00:00\u2033',
    'hwclock --systohc',
    ("find /home/bruno/old-friends -type f "
     "-exec sed -i 's/ugly/beautiful/g' {} \\;"),
    'date -s "2 OCT 2006 18:00:00"',
    u"sed 's/FINDSTRING/REPLACESTRING/g' $fl.old > $fl",
    'date 030613252012',
    u'date set=\u201d2 OCT 2006 18:00:00\u2033',
    u'hwclock \u2013show',
    'du -h -s *',
    'date +%Y%m%d -s "20080817"',
    'ar r lib.a chap2 ?...',
    u'date \u2013set=\u201d2 OCT 2006 18:00:00\u2033',
    'hwclock -w',
    u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d',
    'hwclock -r'])


class TestCommandExtract(TestCase):

    def test_extract_commands(self):
        cmds = extract_commands(iter_html_docs(TEST_DATA_DIR))
        self.assertEqual(set(cmds.commands.keys()), MERGED_COMMANDS)

        cmds = extract_commands(iter_html_docs(TEST_DATA_DIR), 'xargs')
        self.assertEqual(set(cmds.commands.keys()), set([
            'find /tmp -name "*.tmp" | xargs rm',
            u'find ./music -name "*.mp3" -print0 | xargs -0 ls',
            'find . -name "*.sh" | xargs grep "ksh"',
            'find /tmp -name "*.tmp" -print0 | xargs -0 rm',
            'find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts',
            u'find ./work -print | xargs grep "profit"']))

        cmds = extract_commands(
            get_html_doc(TEST_DATA_DIR, 'stackoverflow.com'), 'xargs')
        self.assertEqual(cmds.commands, {})

        doc = HtmlDocument('http://stackoverflow.com', b'')
        doc.body = None
        cmds = extract_commands(doc)
        self.assertEqual(cmds.nr_docs, 0)

    def test_iter_texts(self):
        extractor = CommandExtractor()
        for doc in iter_html_docs(TEST_DATA_DIR):
            print(doc.url.url)
            nr_txts = 0
            for line, txt in extractor.iter_text_lines(doc):
                nr_txts += 1
            self.assertEqual(NR_TEXTS[doc.url.url], nr_txts)

    def test_iter_commands(self):
        extractor = CommandExtractor()
        for doc in iter_html_docs(TEST_DATA_DIR):
            print(doc.url.url)
            for (line, cmd), correct in zip(extractor.iter_commands(doc),
                                            COMMANDS[doc.url.url]):
                self.assertEqual((line, cmd), correct)

    def test_get_command(self):
        ext = CommandExtractor('find')
        self.assertEqual(ext.get_command('$ find . -name "*.mp3"'),
                         'find . -name "*.mp3"')
        self.assertIsNone(ext.get_command('# ls -hl'))
        self.assertIsNone(ext.get_command('find a file'))
        self.assertIsNone(ext.get_command('Find . -name "*.mp3"'))

    def test_sudo(self):
        ext = CommandExtractor('ls')
        self.assertEqual(ext.get_command('# sudo ls -hl'),
                         'ls -hl')
        ext = CommandExtractor('sudo')
        self.assertEqual(
            ext.get_command('# sudo -u www vi ~www/htdocs/index.html'),
            'sudo -u www vi ~www/htdocs/index.html')

    def test_has_wanted_command(self):
        ext = CommandExtractor('xargs')
        self.assertTrue(ext.has_wanted_command(
            u'find ./music -name "*.mp3" -print0 | xargs -0 ls'))
        self.assertFalse(ext.has_wanted_command(
            u'find ./music -name "*.mp3" -print0 | grep xargs'))

        ext = CommandExtractor(['du', 'mv'])
        self.assertTrue(ext.has_wanted_command(
            u'du -h -s *'))
        self.assertFalse(ext.has_wanted_command(
            u'ls -hl'))

        ext = CommandExtractor(['git commit'])
        self.assertTrue(ext.has_wanted_command(
            u'git commit --amend'))
        self.assertFalse(ext.has_wanted_command(
            u'git pull origin master'))

    def test_is_command_name(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command_name('ls'))
        self.assertTrue(ext.is_command_name('l'))
        self.assertTrue(ext.is_command_name('7z'))
        self.assertTrue(ext.is_command_name('apt-get'))

        self.assertFalse(ext.is_command_name(''))
        self.assertFalse(ext.is_command_name('1'))
        self.assertFalse(ext.is_command_name('22'))
        self.assertFalse(ext.is_command_name('apt-'))
        self.assertFalse(ext.is_command_name('-'))
        self.assertFalse(ext.is_command_name('-ls'))
        self.assertFalse(ext.is_command_name('apt get'))
        self.assertFalse(ext.is_command_name('APT-GET'))

    def test_is_command_output(self):
        ext = CommandExtractor()
        self.assertTrue(ext.is_command_output(
            'drwxr-xr-x   3 root root 4,0K maj  5  2014 home'))
        self.assertFalse(ext.is_command_output('total 0'))

    def test_is_command(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command(
            u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d'))
        self.assertTrue(ext.is_command('uname -a'))
        self.assertTrue(ext.is_command('git log'))

        self.assertFalse(ext.is_command(''))
        self.assertFalse(ext.is_command('when I use:'))
        self.assertFalse(ext.is_command('is used.'))
        self.assertFalse(ext.is_command('thank you!!!!'))
        self.assertFalse(ext.is_command('thanks for sharing'))
        self.assertFalse(ext.is_command(
            'drwxr-xr-x   3 root root 4,0K maj  5  2014 home'))
        self.assertFalse(ext.is_command(
            'ls -al %s' % 'a'*ext.MAX_COMMAND_LENGTH))
        self.assertFalse(ext.is_command(
            ("you can use '-c' & '-w' with wc to obtain number of characters"
             "and words repectively")))
        self.assertFalse(ext.is_command('250 total'))

        # TODO
        self.assertTrue(ext.is_command('thanx :)'))
