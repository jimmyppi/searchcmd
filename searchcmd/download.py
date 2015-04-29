import re
from urlparse import urlparse
from concurrent.futures import as_completed

from requests_futures.sessions import FuturesSession

def iter_get(requests):
    if isinstance(requests, Request):
        requests = [requests]
    session = FuturesSession(max_workers=10)
    futures_to_req = dict(
        (session.get(req.url, headers=req.headers, timeout=req.timeout),
         (req, i)) for i, req in enumerate(requests))
    for future in as_completed(futures_to_req):
        if future.exception() is not None:
            req, idx = futures_to_req[future]
            yield DownloadError(req, idx, future.exception())
        else:
            resp = future.result()
            _, idx = futures_to_req[future]
            yield HtmlDocument(resp.url, resp.text, idx)


class DownloadError(object):
    def __init__(self, request, idx, err):
        self.request = request
        self.idx = idx
        self.err = err


class Request(object):
    def __init__(self, url, headers=None, timeout=None):
        self.url = url
        self.headers = headers
        self.timeout = timeout or 3.03


class HtmlDocument(object):
    def __init__(self, url, body, idx):
        self.url = Url(url)
        self.body = body
        self.nr_lines = float(len(body.split('\n')))
        self.idx = idx

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
        # TODO: Double top domain, example: .co.uk
        self.base_domain = '.'.join(self.domain.split('.')[-2:])
