#!/usr/bin/python

"""
Main entry point of the application.

TODO:
*- cli (-v --verbose -e --engine --no-cache)
*- Prettier output, color output?
*- cli flags have been reversed
*- cache does not work to load from
*- Sometimes you do not want to split on '\n' ("search replace")
    Sometimes you do ("get process id", docker "remove stopped containers").
    In those two examples, the output of the command is included in a code-tag.
    tar "unpack", listing of examples in one code block. But that was in
    pre-tag, which should always be splitted by \n.
*- handle of when command starts with sudo
*- print download progress (one dot per downloaded search result?),
    x when error
*- implement download.get
*- support for using beautifulsoup if lxml fails
*- cache (store in tmp), store as json? to_json/from_json for commands-
- "or space)"
- test example with unicode: date "set time", cyberciti.biz
- support for more advanced prompt? um@server#find . -name "*sh*"
- split command on pipe (|). Example: Want xargs examples, but xargs is mostly
   invoked by piping other result to it: find ... | xargs ...
- error handling (go to next if download fails?, logging of extraction errors?)
- tests (py2 + py3)
- package

- should be possible to merge commands.. All with same name and same flags
   should at least be related
"""
import argparse

#__package__ = 'searchcmd'

from search_engines import get_engine, ENGINES
from cmdextract import extract_commands
from download import get, iter_get, Request
import cache


EXAMPLES = """Examples:
searchcmd git commit "change last commit message"
searchcmd find directory
searchcmd "search replace"
"""


def get_arg_parser():
    parser = argparse.ArgumentParser(
        epilog=EXAMPLES, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument(
        'query', nargs='+',
        help="Type a command and/or describe what you want in quotes.")
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
       args (): Parsed command line.

    Some assumptions are made about args.query:

    * If only one element in the query and the element contains only one
       word, assume that it is a command and we want to see general examples
       of how to use this command.

    args.query == ['find'] => cmd == 'find', query == None

    * If only one element in query and the element contains more than one
       word, assume that it is a description of what we want to do and the
       exact command is unknown.

    args.query == ['search replace'] => cmd == None, query == 'search replace'

    * If more than one element in query, assume that the last element is
       a description of what we want to do and the elements before define the
       command.

    args.query == ['git', 'commit', 'change last commit message'] =>
       cmd == 'git commit', query == 'change last commit message'
    """
    if not args:
        parser = get_arg_parser()
        args = parser.parse_args()

    orig_query = args.query

    if len(orig_query) == 1:
        orig_query = orig_query[0]
        if len(orig_query.split()) == 1:
            cmd = orig_query
            query = None
        else:
            cmd = None
            query = orig_query
    else:
        cmd = ' '.join(orig_query[:-1])
        query = orig_query[-1]

    search_args = dict(query=query, cmd=cmd, search_engine=args.engine,
                       max_download=args.max_download)
    commands = None
    if not args.no_cache:
        commands = cache.get(**search_args)
    if commands is None:
        commands = search(**search_args)
    cache.store(commands, **search_args)

    for cmd in commands.rank_commands(nr=args.max_hits):
        print cmd.echo(verbose=args.verbose)


def search(query=None, cmd=None, search_engine='google', max_download=5):
    if not cmd and not query:
        raise ValueError('At least one of query and cmd are needed')
    if not query:
        query = 'examples'
    query = ' '.join([part for part in ['linux', cmd, query] if part])

    engine = get_engine(search_engine)
    search_req = engine.get_search_request(query)

    search_result = get(search_req)
    urls = engine.get_hits(search_result)
    docs = iter_get([Request(u.url) for u in urls[:max_download]])
    
    return extract_commands(docs, base_commands=cmd)


if __name__ == '__main__':
    main()
