FROM debian:stretch-slim
LABEL maintainer="Patrick Plocke <patrick.plocke@flaconi.de>"

# This file was heavily inspired by: https://github.com/docker-library/openjdk/blob/894a19d0401349d39ced7764190ea6263bb17ba0/11/jre/slim/Dockerfile


###
### Build arguments
###
ARG JAVA_VERSION=8

###
### Installation
###

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Do some fancy footwork to create a JAVA_HOME that's cross-architecture-safe
RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home
ENV JAVA_HOME /docker-java-home

# Bootstrap system
RUN set -ex \
	&& mkdir -p /usr/share/man/man1 \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
		"openjdk-${JAVA_VERSION}-jre-headless" \
	&& rm -rf /var/lib/apt/lists/*


###
### Default entrypoint
###
CMD ["-version"]
ENTRYPOINT ["java"]
