FROM python:3-alpine

MAINTAINER Joe Black <me@joeblack.nyc>

RUN apk add --no-cache \
		ca-certificates \
		curl \
		git \
		openssl \
		tar

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 17.06.0-ce
ENV DOCKER_SHA256 cadc6025c841e034506703a06cf54204e51d0cadfae4bae62628ac648d82efdd

RUN set -x \
	&& curl -fSL "https://download.docker.com/linux/static/$DOCKER_CHANNEL/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& tar -xzvf docker.tgz --strip-components 1 --directory /usr/local/bin/ \
	&& docker -v && dockerd -v

RUN mkdir -p /repos/app

ENV TESTDOCKER_VERSION 0.2.6

RUN pip3 install --upgrade docker-compose docker
RUN pip3 install testdocker==$TESTDOCKER_VERSION

COPY entrypoint /

VOLUME ["/repos/app"]
WORKDIR /repos/app

ENTRYPOINT ["/entrypoint"]

ENV PYTEST_ADDOPTS "--verbose --showlocals"
ENV GITHUB_ORG telephoneorg
