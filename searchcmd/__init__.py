#!/usr/bin/python
"""
Main entry point of the application.
"""
import sys
import argparse

from searchcmd.search_engines import get_engine, ENGINES
from searchcmd.cmdextract import extract_commands
from searchcmd.download import get, iter_get, Request, DownloadError
from searchcmd import cache

EXAMPLES = """Examples:
searchcmd git commit "change last commit message"
searchcmd find directory
searchcmd "search replace"
"""


def get_print_func(io):
    """This is a workaround go get mocking of stdout to work with
    both py2 and py3.
    """
    if sys.version_info[0] == 2:
        return io.write
    else:
        return io.writelines

stdout = get_print_func(sys.stdout)
stderr = get_print_func(sys.stderr)


class SearchError(Exception):
    pass


def get_arg_parser():
    parser = argparse.ArgumentParser(
        epilog=EXAMPLES, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument(
        'query', nargs='+',
        help="Type a command and/or describe what you want to do in quotes.")
    parser.add_argument('-v', '--verbose', action='store_true',
                        help='Include source url in output.')
    parser.add_argument('--no-cache', action='store_true',
                        help='Skip cache, always do a new search.')
    parser.add_argument('--engine', help='The search engine to use.',
                        default='google', choices=ENGINES.keys())
    parser.add_argument('-n', '--max-hits', default=5, type=int,
                        help='Max number of commands to show.')
    parser.add_argument('--max-download', default=5, type=int,
                        help='Download max this number of search hits.')
    return parser


def main(args=None):
    """
    Args:
       args (list): Command line arguments.
    Returns:
       int: exit code.
    """
    parser = get_arg_parser()
    args = parser.parse_args(args)

    query_string, cmd = get_query_string(args.query)

    search_args = {'query_string': query_string,
                   'cmd': cmd,
                   'search_engine': args.engine,
                   'max_download': args.max_download}
    commands = None
    if not args.no_cache:
        commands = cache.get(**search_args)
    if commands is None:
        try:
            commands = search(**search_args)
        except SearchError as e:
            stderr(str(e) + u'\n')
            return 1
    cache.store(commands, **search_args)
    for cmd in commands.rank_commands(nr=args.max_hits):
        stdout(cmd.echo(verbose=args.verbose) + u'\n')
    return 0


def parse_query(orig_query):
    """Divide query into command name and search query.

    Args:
       orig_query ([str]): The original query.
    Returns:
       (str, str): Command name and search query.

    Some assumptions are made about the original query:

    * If only one element in the orig query and the element contains only one
      word, assume that it is a command and we want to see general examples
      of how to use this command.

      Example:
      parse_query(['find']) == ('find', 'examples')

    * If only one element in the orig query and the element contains more
      than one word, assume that it is a description of what we want to do
      and the exact command is unknown.

      Example:
      parse_query(['search replace']) == (None, 'search replace')

    * If more than one element in query, assume that the last element is
      a description of what we want to do and the elements before define the
      command.

      Example:
      parse_query(['git', 'commit', 'change last commit message']) == (
         'git commit', 'change last commit message')
    """
    if len(orig_query) == 1:
        orig_query = orig_query[0]
        if len(orig_query.split()) == 1:
            return orig_query, 'examples'
        else:
            return None, orig_query
    else:
        return ' '.join(orig_query[:-1]), orig_query[-1]


def get_query_string(orig_query):
    if not orig_query:
        raise ValueError('No query provided')
    cmd, query = parse_query(orig_query)
    return ' '.join([part for part in ['linux', cmd, query] if part]), cmd


def search(query_string=None, cmd=None, search_engine='google',
           max_download=5):
    engine = get_engine(search_engine)
    search_req = engine.get_search_request(query_string)
    search_result = get(search_req)
    if isinstance(search_result, DownloadError):
        raise SearchError('Failed search on {} ({})'.format(
            search_engine, search_result.status_code))
    urls = engine.get_hits(search_result)
    docs = iter_get([Request(u.url) for u in urls[:max_download]])

    return extract_commands(docs, base_commands=cmd)


if __name__ == '__main__':
    sys.exit(main())
