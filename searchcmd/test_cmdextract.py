import os
from unittest import TestCase

from download import HtmlDocument
from cmdextract import CommandExtractor

TEST_DATA_DIR = os.path.join(os.path.dirname(__file__), 'testdata')


def iter_html_docs():
    for fname in os.listdir(TEST_DATA_DIR):
        yield get_html_doc(fname)


def get_html_doc(fname):
    with open(os.path.join(TEST_DATA_DIR, fname)) as inp:
        body = inp.read()
    base_url = 'http://%s' % fname
    return HtmlDocument(base_url, body)


def test_iter_texts():
    extractor = CommandExtractor()
    for doc in iter_html_docs():
        print doc.url.url
        for line, txt in extractor.iter_text_lines(doc):
            print line, [txt]


def test_iter_commands():
    extractor = CommandExtractor()
    for doc in iter_html_docs():
        print doc.url.url
        for line, cmd in extractor.iter_commands(doc):
            print line, [cmd]


class TestCommandExtract(TestCase):

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

    def test_is_command_name(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command_name('ls'))
        self.assertTrue(ext.is_command_name('l'))
        self.assertTrue(ext.is_command_name('7z'))
        self.assertTrue(ext.is_command_name('apt-get'))

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
        self.assertFalse(ext.is_command_output(
            'total 0'))

    def test_is_command(self):
        ext = CommandExtractor()

        self.assertTrue(ext.is_command(
            u'date -s \u201cYYYY-MM-DD HH:MM:SS\u201d'))
        self.assertTrue(ext.is_command('uname -a'))

        # TODO
        self.assertFalse(ext.is_command('git log'))
        self.assertTrue(ext.is_command('thanx :)'))

        self.assertFalse(ext.is_command('when I use:'))
        self.assertFalse(ext.is_command('is used.'))
        self.assertFalse(ext.is_command('thank you!!!!'))
        self.assertFalse(ext.is_command('thanks for sharing'))
        self.assertFalse(ext.is_command(
            'drwxr-xr-x   3 root root 4,0K maj  5  2014 home'))
        self.assertFalse(ext.is_command('ls -%s' % 'a'*ext.MAX_COMMAND_LENGTH))
        self.assertFalse(ext.is_command(
            ("you can use '-c' & '-w' with wc to obtain number of characters"
             "and words repectively.")))
        self.assertFalse(ext.is_command('250 total'))
