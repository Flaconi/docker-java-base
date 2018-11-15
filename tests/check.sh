#!/usr/bin/env bash

# Be strict
set -u
set -e
set -o pipefail

# Directory path
CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)/.."


if [ ${#} -ne 3 ]; then
	echo "Usage: $0 <image-name> <image-tag> <version>"
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

echo "[CHECK] Checking run"
echo "------------------------------------------------------------"
docker run "${1}:${2}"
echo

echo "[CHECK] Checking java version"
echo "------------------------------------------------------------"
if [[ "${2}" =~ "openjdk" ]]; then
	# OpenJDK Java returns a different version string
	docker run "${1}:${2}" 2>&1 | grep -io "openjdk version \"1.${3}."
else
	if [ "${3}" -eq "8" ]; then
		docker run "${1}:${2}" 2>&1 | grep -io "java version \"1.${3}."
	else
		docker run "${1}:${2}" 2>&1 | grep -io "java version \"${3}."
	fi
fi
echo
