#!/usr/bin/env bash

# Be strict
set -u
set -e
set -o pipefail

# Directory path
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/.."

cd "${CWD}"

echo "************************************************************"
echo "* Checking git                                             *"
echo "************************************************************"
git-conflicts --path=.
git-ignored --path=.
echo
echo


echo "************************************************************"
echo "* Checking line endings                                    *"
echo "************************************************************"
file-cr --path=. --text --ignore=.git
file-crlf --path=. --text --ignore=.git
echo
echo


echo "************************************************************"
echo "* Checking empty and nullbyte char                         *"
echo "************************************************************"
file-empty --path=. --text --ignore=.git
file-nullbyte-char --path=. --text --ignore=.git
echo
echo


echo "************************************************************"
echo "* Checking trailing space and newline                      *"
echo "************************************************************"
file-trailing-newline --path=. --text --ignore=.git
file-trailing-single-newline --path=. --text --ignore=.git
file-trailing-space --path=. --text --ignore=.git
echo
echo


echo "************************************************************"
echo "* Checking utf8 and utf8-bom                               *"
echo "************************************************************"
file-utf8 --path=. --text --ignore=.git
file-utf8-bom --path=. --text --ignore=.git
