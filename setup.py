import sys
from setuptools import setup
"http://stackoverflow.com/questions/19559247/requirements-txt-depending-on-python-version"
if sys.version_info[0] == 2:
    requirements += py2_requirements
else:
    requirements += py3_requirements

setup(
    name = 'searchcmd',
    packages = ['searchcmd'],
    version = '0.1',
    description = 'Search for commands on the internets from the cli',
    author = 'Jimmy Petersson',
    author_email = 'jimmy.petersson@gmail.com',
    url = 'https://github.com/jimmyppi/searchcmd/',
    license = '', # TODO
    entry_points = {
        'console_scripts': ['searchcmd = searchcmd.searchcmd:main']
    },
    classifiers = ['Programming Language :: Python',# TODO
               ],
)
