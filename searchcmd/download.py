import re
import sys
try:
    from urllib.parse import urlparse
except ImportError:
    from urlparse import urlparse
from concurrent.futures import as_completed

from requests.packages import urllib3
from requests_futures.sessions import FuturesSession
from lxml.html import fromstring, tostring
try:
    from lxml.html import soupparser
except ImportError:
    soupparser = None
import tld

urllib3.disable_warnings()


def get(request):
    session = FuturesSession(max_workers=1)
    future = next(as_completed([session.get(
        request.url, headers=request.headers, timeout=request.timeout)]))
    if future.exception() is not None:
        return DownloadError(request, future.exception())
    else:
        resp = future.result()
        return HtmlDocument(resp.url, resp.content)


def iter_get(requests, verbose=True):
    if isinstance(requests, Request):
        requests = [requests]
    session = FuturesSession(max_workers=10)
    futures_to_req = dict(
        (session.get(req.url, headers=req.headers, timeout=req.timeout),
         (req, i)) for i, req in enumerate(requests))
    for future in as_completed(futures_to_req):
        if future.exception() is not None:
            req, idx = futures_to_req[future]
            if verbose:
                sys.stdout.writelines(u'x')
                sys.stdout.flush()
            yield DownloadError(req, future.exception(), idx)
        else:
            resp = future.result()
            _, idx = futures_to_req[future]
            if verbose:
                sys.stdout.writelines(u'.')
                sys.stdout.flush()
            yield HtmlDocument(resp.url, resp.content, idx)
    if verbose:
        sys.stdout.writelines(u'\n')


class DownloadError(object):
    def __init__(self, request, err, idx=None):
        self.request = request
        self.idx = idx
        self.err = err
        self.status_code = None
        if hasattr(err, 'status_code'):
            self.status_code = err.status_code


class Request(object):
    def __init__(self, url, headers=None, timeout=None):
        self.url = url
        self.headers = headers
        self.timeout = timeout or 3.03


class HtmlDocument(object):
    def __init__(self, url, body, idx=None, nr_lines=None):
        self.url = Url(url)
        self.body = body
        self.nr_lines = nr_lines
        if self.nr_lines is None:
            self.nr_lines = float(len(body.split(b'\n')))
        self.idx = idx
        self._tree = None

    @property
    def tree(self):
        if self._tree is not None:
            return self._tree
        try:
            self._tree = fromstring(self.body, base_url=self.url.url)
            _ = tostring(self._tree, encoding='unicode')
        except:
            try:
                self._tree = soupparser.fromstring(self.body)
            except:
                pass
        return self._tree

    def to_dict(self):
        return {'url': self.url.url,
                'nr_lines': self.nr_lines,
                'idx': self.idx}

    @classmethod
    def from_dict(cls, d):
        return cls(d['url'], b'', d['idx'], d['nr_lines'])


class Url(object):
    def __init__(self, url):
        self.url = url
        self.domain = re.sub('^www.', '', urlparse(self.url).netloc)
        self.base_domain = tld.get_tld(self.url)
