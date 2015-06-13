===============================
searchcmd
===============================

.. image:: https://img.shields.io/travis/jimmyppi/searchcmd.svg
        :target: https://travis-ci.org/jimmyppi/searchcmd

.. image:: https://img.shields.io/pypi/v/searchcmd.svg
        :target: https://pypi.python.org/pypi/searchcmd

* Free software: BSD license

Get help from your friends on the internets without leaving your best friend the cli.

Motivation
----------

Many commands have really many flags and the man pages often lack examples. It is usually faster to go to your browser and search for what you want to do.

Installation
------------

::

 sudo apt-get install libxml2-dev libxslt-dev python-dev
 pip install searchcmd

Examples
--------

::

 # searchcmd git commit "change last commit message"
 git commit      (git-scm.com, kernel.org)
 git commit --amend      (help.github.com)
 git commit –amend -m ‘new message’      (makandracards.com)
 git commit --amend --no-edit    (kernel.org)
 git commit -c ORIG_HEAD (kernel.org)

::

 # searchcmd find "sort files by size"
 find . -type f -printf "%s\t%p\n" | sort -n     (unix.stackexchange.com)
 find . -type f | xargs du -h | sort -rn (unix.stackexchange.com)
 find . -type f -print0 | xargs -0 ls -la | awk '{print int($5/1000) " KB\t" $9}' | sort -n -r -k1       (unix.stackexchange.com)
 find . -type f -ls | sort -r -n -k7     (unix.stackexchange.com)
 find . -type f -ls -printf '\0' | sort -zk7rn | tr -d '\0'      (unix.stackexchange.com)

Manual
------

::

 usage: searchcmd [-h] [-v] [--no-cache] [--engine {bing,google}] [-n MAX_HITS]
                  [--max-download MAX_DOWNLOAD]
                  query [query ...]

 positional arguments:
   query                 Type a command and/or describe what you want to do in
                         quotes.

 optional arguments:
   -h, --help            show this help message and exit
   -v, --verbose         Include source url in output.
   --no-cache            Skip cache, always do a new search.
   --engine {bing,google}
                         The search engine to use.
   -n MAX_HITS, --max-hits MAX_HITS
                         Max number of commands to show.
   --max-download MAX_DOWNLOAD
                         Download max this number of search hits.

 Examples:
 searchcmd git commit "change last commit message"
 searchcmd find directory
 searchcmd "search replace"

Similar projects
----------------

Useful examples at the command line:
https://github.com/srsudar/eg

Search commandlinefu.com from the terminal:
https://github.com/ncrocfer/clf

Todo
----

* Support for recognizing more advanced prompts. Example: `um@server#find . -name "*sh*"`
* Merge commands that do the same thing.
* Support for beautifulsoup in py3.
* An open ended search (for example "search replace") will only find commands that are installed on the system. Better filtering of false positives is needed to allow unknown commands. A solution could be to train a probabilistic parser like https://github.com/datamade/parserator
