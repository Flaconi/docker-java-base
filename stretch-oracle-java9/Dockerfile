FROM debian:stretch
MAINTAINER "Patrick Plocke" <patrick.plocke@flaconi.de>


###
### Build arguments
###
ARG JAVA_VERSION=9
ARG ORACLE_REP="deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
ARG ORACLE_KEY="c2518248eea14886"

# Java packages to install
ARG JAVA_DEPS=" \
	oracle-java${JAVA_VERSION}-installer \
	oracle-java${JAVA_VERSION}-set-default \
	"

# Required tools for installation
ARG BUILD_DEPS=" \
	dirmngr \
	gnupg \
	software-properties-common \
	"


###
### Installation
###

# Bootstrap system
RUN set -x \
	# Upgrade system
	&& apt-get update \
	&& apt-get upgrade -y \
	# Install build deps and run deps
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		${BUILD_DEPS} \
	# Install Oracle deb repositories
	&& apt-key adv --no-tty --keyserver keyserver.ubuntu.com --recv-keys "${ORACLE_KEY}" \
	&& add-apt-repository "${ORACLE_REP}" \
	&& apt-get update \
	# Install Oracle Java (auto-accepting licence with YES prepended) and other tools
	&& yes | apt-get install --no-install-recommends --no-install-suggests -y \
		${JAVA_DEPS} \
	# Remove build deps and obsolete packages
	&& rm -rf "/var/cache/oracle-jdk${JAVA_VERSION}-installer" \
	&& apt-key del "${ORACLE_KEY}" \
	&& apt-add-repository --remove "${ORACLE_REP}" \
	&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps \
		${BUILD_DEPS} \
	&& rm -rf /var/lib/apt/lists/*


###
### Default entrypoint
###
CMD ["-version"]
ENTRYPOINT ["java"]
