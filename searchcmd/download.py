import re
import sys
from urlparse import urlparse
from concurrent.futures import as_completed

from requests_futures.sessions import FuturesSession
from lxml.html import fromstring, tostring, soupparser
import tld


def get(request):
    session = FuturesSession(max_workers=1)
    future = next(as_completed([session.get(
        request.url, headers=request.headers, timeout=request.timeout)]))
    if future.exception() is not None:
        return DownloadError(request, future.exception())
    else:
        resp = future.result()
        return HtmlDocument(resp.url, resp.text)


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
                sys.stdout.write('x')
                sys.stdout.flush()
            yield DownloadError(req, future.exception(), idx)
        else:
            resp = future.result()
            _, idx = futures_to_req[future]
            if verbose:
                sys.stdout.write('.')
                sys.stdout.flush()
            yield HtmlDocument(resp.url, resp.text, idx)
    if verbose:
        print


class DownloadError(object):
    def __init__(self, request, err, idx=None):
        self.request = request
        self.idx = idx
        self.err = err


class Request(object):
    def __init__(self, url, headers=None, timeout=None):
        self.url = url
        self.headers = headers
        self.timeout = timeout or 3.03


class HtmlDocument(object):
    def __init__(self, url, body, idx=None):
        self.url = Url(url)
        self.body = body
        self.nr_lines = float(len(body.split('\n')))
        self.idx = idx
        self._tree = None

    @property
    def tree(self):
        if self._tree:
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
                'body': self.body,
                'idx': self.idx}

    @classmethod
    def from_dict(cls, d):
        return cls(d['url'], d['body'], d['idx'])


class Url(object):
    def __init__(self, url):
        self.url = url
        self.domain = re.sub('^www.', '', urlparse(self.url).netloc)
        self.base_domain = tld.get_tld(self.url)
