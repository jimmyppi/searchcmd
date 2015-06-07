import os
from searchcmd.download import HtmlDocument

BASE_DATA_DIR = os.path.join(os.path.dirname(__file__), 'testdata')


def iter_html_docs(data_dir):
    for fname in os.listdir(os.path.join(BASE_DATA_DIR, data_dir)):
        yield get_html_doc(data_dir, fname)


def get_html_doc(data_dir, fname):
    with open(os.path.join(BASE_DATA_DIR, data_dir, fname), 'rb') as inp:
        body = inp.read()
    base_url = 'http://%s' % fname
    return HtmlDocument(base_url, body)
