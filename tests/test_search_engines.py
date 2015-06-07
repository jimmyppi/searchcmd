from unittest import TestCase

from tests.testutils import get_html_doc
from searchcmd.search_engines import get_engine

TEST_DATA_DIR = 'search_engines'


class TestSearchEngines(TestCase):

    def test_google(self):
        urls = [
            'http://www.thegeekstuff.com/2013/12/xargs-examples/',
            'http://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/',
            'http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html',
            'http://javarevisited.blogspot.com/2012/06/10-xargs-command-example-in-linux-unix.html',
            'http://www.computerhope.com/unix/xargs.htm',
            'http://en.wikipedia.org/wiki/Xargs',
            'http://unix.stackexchange.com/questions/24954/when-is-xargs-needed',
            'https://sidvind.com/wiki/Xargs_by_example',
            'http://linux.about.com/od/commands/a/Example-Uses-Of-The-xargs-Command.htm',
            'http://www.linuxplanet.com/linuxplanet/tutorials/6522/1'] 
        self._test_engine('google', urls)

    def test_bing(self):
        urls = [
            'http://www.cyberciti.biz/faq/linux-unix-bsd-xargs-construct-argument-lists-utility/',
            'http://www.thegeekstuff.com/2013/12/xargs-examples/',
            'http://javarevisited.blogspot.com/2012/06/10-xargs-command-example-in-linux-unix.html',
            'http://www.computerhope.com/unix/xargs.htm',
            'http://linux.101hacks.com/linux-commands/xargs-command-examples/',
            'http://en.wikipedia.org/wiki/Xargs',
            'https://www.mkssoftware.com/docs/man1/xargs.1.asp',
            'http://linux.about.com/od/commands/a/Example-Uses-Of-The-xargs-Command.htm',
            'http://www.folkstalk.com/2012/07/xargs-command-examples-in-unix-linux.html',
            'http://linux.die.net/man/1/xargs']
        self._test_engine('bing', urls)

    def test_non_existent(self):
        with self.assertRaises(ValueError):
            get_engine('non_existent')

    def _test_engine(self, engine, expected_urls):
        e = get_engine(engine)
        req = e.get_search_request('test query')
        self.assertTrue('test+query' in req.url)

        doc = get_html_doc(TEST_DATA_DIR, '%s.com' % engine)

        urls = e.get_hits(doc)
        self.assertEqual([u.url for u in urls], expected_urls)
