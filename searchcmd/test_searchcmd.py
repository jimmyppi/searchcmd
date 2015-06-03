import sys
from io import BytesIO
from unittest import TestCase

import requests_mock

from commands import Commands
from testutils import get_html_doc
from search_engines import get_engine
import searchcmd
main = searchcmd.main


class TestSearchCommand(TestCase):

    def setUp(self):
        self.orig_stdout = sys.stdout
        self.internal_stdout = BytesIO()
        sys.stdout = self.internal_stdout

    def tearDown(self):
        sys.stdout = self.orig_stdout

    def test_query(self):
        self.result = None

        def mock_search(query_string=None, cmd=None, **kwargs):
            self.result = (cmd, query_string)
            return Commands()

        orig_search = searchcmd.search
        searchcmd.search = mock_search
        try:
            main(['find', '--no-cache'])
            self.assertEqual(self.result, ('find', 'linux find examples'))
            main(['search replace', '--no-cache'])
            self.assertEqual(self.result, (None, 'linux search replace'))
            main(['git', 'commit', 'change last commit message', '--no-cache'])
            self.assertEqual(
                self.result, ('git commit',
                              'linux git commit change last commit message'))
            with self.assertRaises(ValueError):
                searchcmd.get_query_string([])
        finally:
            searchcmd.search = orig_search

    def test_engine(self):
        so = get_html_doc('cmdextract', 'stackoverflow.com')
        query = ['du']
        options = ['--engine', 'bing', '--no-cache']
        with requests_mock.mock() as m:
            self._setup_request_mock(m, query, [so], search_engine='bing')
            main(query + options)
        self._check_output(contains='du')

    def test_cache(self):
        so = get_html_doc('cmdextract', 'stackoverflow.com')
        query = ['du']
        options = ['--no-cache']
        with requests_mock.mock() as m:
            self._setup_request_mock(m, query, [so])
            main(query + options)
        self._check_output(contains='du')
        self._truncate_stdout()
        with requests_mock.mock() as m:
            main(query)
        self._check_output(contains='du')

    def test_max_download(self):
        with requests_mock.mock() as m:
            self._setup_request_mock(m, ['du'], [])
            main(['du', '--no-cache', '--max-download', '0'])
        self.assertNotIn('du', self._get_current_stdout())

    def test_verbose(self):
        so = get_html_doc('cmdextract', 'stackoverflow.com')
        query = ['du']
        options = ['-v']
        with requests_mock.mock() as m:
            self._setup_request_mock(m, query, [so])
            main(query)
        non_verbose = self._get_current_stdout()
        self._truncate_stdout()
        with requests_mock.mock() as m:
            main(query + options)
        self.assertGreater(len(self._get_current_stdout()), len(non_verbose))

    def test_max_hits(self):
        so = get_html_doc('cmdextract', 'stackoverflow.com')
        query = ['du']
        options = ['--max-hits', '1']
        with requests_mock.mock() as m:
            self._setup_request_mock(m, query, [so])
            main(query)
        nr_lines = len(self._get_current_stdout().split('\n'))
        self._truncate_stdout()
        with requests_mock.mock() as m:
            main(query + options)
        self.assertGreater(
            nr_lines, len(self._get_current_stdout().split('\n')))

    def _get_current_stdout(self):
        return self.internal_stdout.getvalue()

    def _truncate_stdout(self):
        self.internal_stdout.truncate(0)

    def _setup_request_mock(self, mock, query, search_results,
                            search_engine='google'):
        engine_doc = get_html_doc('search_engines', search_engine + '.com')
        e = get_engine(search_engine)
        query_string, _ = searchcmd.get_query_string(query)
        url = e.get_search_request(query_string).url
        mock.get(url, content=engine_doc.body)
        urls = e.get_hits(engine_doc)
        for url, result in zip(urls, search_results):
            mock.get(url.url, content=result.body)

    def _check_output(self, nr_lines=None, contains=None, equals=None):
        out = self._get_current_stdout()
        if nr_lines is not None:
            self.assertEqual(len(out.split('\n')), nr_lines)
        if contains is not None:
            self.assertIn(contains, out)
        if equals is not None:
            self.assertEqual(out, equals)
