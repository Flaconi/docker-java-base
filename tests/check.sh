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

# Translate arguments into variables
image_name=${1}
image_tag=${2}
java_version=${3}

if [ ! -d "${CWD}/${image_tag}" ]; then
	echo "Image tag does not exist: '${2}'"
	exit 1
fi

if ! [[ ${image_tag} =~ ^[-_.A-Za-z0-9]+$ ]]; then
	echo "Image tag has invalid characters: '${image_tag}'"
	exit 1
fi

echo "[CHECK] Checking run"
echo "------------------------------------------------------------"
docker run "${image_name}:${image_tag}"
echo

echo "[CHECK] Checking java version"
echo "------------------------------------------------------------"
if [[ "${image_tag}" =~ "openjdk" ]]; then
	# OpenJDK Java returns a different version string
	docker run "${image_name}:${image_tag}" 2>&1 | grep -io "openjdk version \"1.${java_version}."
else
	if [ "${java_version}" -eq "8" ]; then
		docker run "${image_name}:${image_tag}" 2>&1 | grep -io "java version \"1.${java_version}."
	else
		docker run "${image_name}:${image_tag}" 2>&1 | grep -io "java version \"${java_version}."
	fi
fi
echo
