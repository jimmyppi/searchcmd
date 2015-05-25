import os
from download import HtmlDocument


def iter_html_docs(data_dir):
    for fname in os.listdir(data_dir):
        yield get_html_doc(data_dir, fname)


def get_html_doc(data_dir, fname):
    with open(os.path.join(data_dir, fname)) as inp:
        body = inp.read()
    base_url = 'http://%s' % fname
    return HtmlDocument(base_url, body)
