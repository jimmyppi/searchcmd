from unittest import TestCase

from tests.testutils import get_html_doc, iter_html_docs
from searchcmd import cache


class TestCache(TestCase):

    def test_cache(self):
        doc = get_html_doc('search_engines', 'google.com')
        docs = list(iter_html_docs('search_engines'))
        obj = {'single': doc, 'multi': docs}

        cache.store(obj, testing=True)
        from_cache = cache.get(testing=True)

        self.assertEqual(from_cache.keys(), obj.keys())
        self.assertEqual(obj['single'].url.url, from_cache['single'].url.url)

        self.assertIsNone(cache.get(does_not_exist=True))
