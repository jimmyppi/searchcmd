"""
Search the internet and extract urls to the search hits.

Usage:

>>> e = get_engine('google')
>>> req = e.get_search_request('linux')

Now download the request and init a html doc.
Extract urls:

>>> urls = e.get_hits(html_doc)

"""

import re
try:
    from urllib import quote_plus, unquote
except ImportError:
    from urllib.parse import quote_plus, unquote
from collections import defaultdict

from lxml import html

from searchcmd.download import Url, Request


def get_engine(name):
    if name not in ENGINES:
        raise ValueError('Unkown search engine: %r' % name)
    return ENGINES[name]


class SearchEngine(object):
    BASE_URL = None
    RE_INTERNAL_DOMAINS = None

    RE_URL_AS_PARAM = re.compile(r'http[^&]+')

    def get_search_request(self, query):
        url = self.BASE_URL.format(quote_plus(query.encode('utf-8')))
        return Request(url=url)

    def get_id(self, tree):
        tag = tree.tag.strip()
        cls = tree.attrib.get('class', '').strip()
        if not cls:
            return tag
        return '@'.join([tag, cls.split()[0]])

    def get_path(self, subtree):
        parent = subtree.getparent()
        if parent.tag == 'body':
            return 'body'
        return '/'.join([self.get_path(parent), self.get_id(subtree)])

    def get_outgoing_url(self, link):
        """Return url if outgoing, else None"""
        url = link.attrib.get('href') or ''
        url = url.strip()
        if not url:
            return
        if not url.startswith('http'):
            if 'http' not in url:
                return
            m = self.RE_URL_AS_PARAM.search(url)
            if not m:
                return
            url = unquote(m.group(0))
        u = Url(url)
        if self.RE_INTERNAL_DOMAINS.search(u.domain):
            return
        return u

    def get_hits(self, html_doc):
        """
        Returns:
           hits ([Url]): List of search result urls.
        """
        tree = html.fromstring(html_doc.body, base_url=html_doc.url.url)
        links = tree.cssselect('a')
        # Group by path in html tree
        groups = defaultdict(list)
        for link in links:
            url = self.get_outgoing_url(link)
            if not url:
                continue
            groups[self.get_path(link)].append(url)
        # Skip groups where all urls have the same base domain
        for path, urls in list(groups.items()):
            if len(set((u.base_domain for u in urls))) == 1:
                groups.pop(path)
        # Return the largest group of urls
        return sorted(groups.values(), key=lambda e: len(e))[-1]


class Google(SearchEngine):

    BASE_URL = 'http://google.com/search?q={}'
    RE_INTERNAL_DOMAINS = re.compile(
        r'(google|googleusercontent)\.[a-z][a-z][a-z]?$')


class Bing(SearchEngine):

    BASE_URL = 'http://bing.com/search?q={}'
    RE_INTERNAL_DOMAINS = re.compile(
        r'(bing|bingj|microsoft)\.[a-z][a-z][a-z]?$')


ENGINES = {
    'google': Google(),
    'bing': Bing(),
}
