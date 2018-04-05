#!/usr/bin/env bash

# Be strict
set -u
set -e
set -o pipefail

# Directory path
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/.."

if [ ${#} -ne 2 ]; then
	echo "Usage: $0 <image-name> <image-tag>"
	exit 1
fi

if [ ! -d "${CWD}/${2}" ]; then
	echo "Image tag does not exist: '${2}'"
	exit 1
fi

if ! [[ ${2} =~ ^[-_.A-Za-z0-9]+$ ]]; then
	echo "Image tag has invalid characters: '${2}'"
	exit 1
fi


cd "${CWD}/${2}"
docker build -t "${1}:${2}" .
