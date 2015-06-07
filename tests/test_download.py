from unittest import TestCase
import requests_mock

from searchcmd import download
from tests.testutils import get_html_doc, iter_html_docs


class TestDownload(TestCase):

    def test_get(self):
        doc = get_html_doc('search_engines', 'google.com')
        req = download.Request(doc.url.url)
        with requests_mock.mock() as m:
            m.get(req.url, content=doc.body)
            resp = download.get(req)
            self.assertIsInstance(resp, download.HtmlDocument)
            self.assertEqual(resp.body, doc.body)

        with requests_mock.mock() as m:
            resp = download.get(req)
            self.assertIsInstance(resp, download.DownloadError)

    def test_iter_get(self):
        docs = list(iter_html_docs('cmdextract'))
        reqs = [download.Request(doc.url.url) for doc in docs]
        with requests_mock.mock() as m:
            for req, doc in zip(reqs[:-1], docs[:-1]):
                m.get(req.url, content=doc.body)
            resps = list(download.iter_get(reqs))
            success = [doc.url.url.strip('/') for doc in resps if
                       isinstance(doc, download.HtmlDocument)]
            for resp in resps:
                if isinstance(resp, download.DownloadError):
                    if isinstance(resp.err, UnicodeDecodeError):
                        raise resp.err
            self.assertEqual(set(success), set([r.url for r in reqs[:-1]]))

            m.get(reqs[-1].url, content=docs[-1].body)
            resps = list(download.iter_get(reqs[-1]))
            self.assertEqual(
                [r.url.url.strip('/') for r in resps], [reqs[-1].url])

    def test_html_document(self):
        for doc in iter_html_docs('cmdextract'):
            self.assertTrue(doc.tree.tag)

        doc_cp = download.HtmlDocument.from_dict(doc.to_dict())
        self.assertEqual(doc_cp.url.url, doc.url.url)
