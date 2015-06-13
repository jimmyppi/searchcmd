#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
from setuptools import setup
from setuptools.command.test import test as TestCommand

with open('README.rst') as readme_file:
    readme = readme_file.read()

with open('HISTORY.rst') as history_file:
    history = history_file.read().replace('.. :changelog:', '')


def get_requirements(file_name):
    with open(file_name) as req_file:
        requirements = [req.strip() for req in req_file.read().split('\n')]
    return [req for req in requirements if req and not req.startswith('-')]

if sys.version_info[0] == 2:
    requirements = get_requirements('requirements-python-2.txt')
else:
    requirements = get_requirements('requirements-python-3.txt')


class PyTest(TestCommand):
    def finalize_options(self):
        TestCommand.finalize_options(self)
        self.test_args = []
        self.test_suite = True

    def run_tests(self):
        import pytest
        errcode = pytest.main(self.test_args)
        sys.exit(errcode)

setup(
    name='searchcmd',
    packages=['searchcmd'],
    version='0.1.0',
    description='Search the internets for commands from the command line.',
    long_description=readme + '\n\n' + history,
    author='Jimmy Petersson',
    author_email='jimmy.petersson@gmail.com',
    url='https://github.com/jimmyppi/searchcmd/',
    package_dir={'searchcmd':
                 'searchcmd'},
    include_package_data=True,
    install_requires=requirements,
    license='lite BSD',
    entry_points={
        'console_scripts': ['searchcmd = searchcmd:main']
    },
    tests_require=['pytest', 'requests_mock'],
    cmdclass={'test': PyTest},
    test_suite='tests',
    extras_require={'testing': ['pytest']},
    zip_safe=False,
    keywords='searchcmd cli',
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'Intended Audience :: System Administrators',
        'License :: OSI Approved :: BSD License',
        'Natural Language :: English',
        "Programming Language :: Python :: 2",
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Operating System :: POSIX',
        'Environment :: Console',
        'Topic :: Software Development',
        'Topic :: System :: Systems Administration'
    ],
)
