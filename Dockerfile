FROM lsiobase/xenial
MAINTAINER sparklyballs

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_CONFIG_HOME="/config/xdg"

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# package versions
ARG SONARR_BRANCH="${SONARR_BRANCH:-master}"
ARG SONARR_BUILD

# add sonarr repository
RUN \
 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
 echo "deb http://apt.sonarr.tv/ ${SONARR_BRANCH} main" > \
	/etc/apt/sources.list.d/sonarr.list && \

# install packages
 SONARR_BUILD_TAG="${SONARR_BUILD+=$SONARR_BUILD}" && \
 echo $SONARR_BUILD_TAG && \
 apt-get update && \
 apt-get install -y \
	libcurl3 \
	nzbdrone${SONARR_BUILD_TAG} && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8989
VOLUME /config /downloads /tv
