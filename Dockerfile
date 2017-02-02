FROM python:3-alpine

RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl \
		git

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.12.6
ENV DOCKER_SHA256 cadc6025c841e034506703a06cf54204e51d0cadfae4bae62628ac648d82efdd

RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v

RUN pip3 install docker-compose docker pytest testdocker
RUN mkdir /repos/app

COPY entrypoint /

VOLUME ["/repos/app"]
WORKDIR /repos/app

ENTRYPOINT ["/entrypoint"]
CMD ["py.test"]

ENV PYTEST_ADDOPTS="--verbose --showlocals"

# To use:
# docker run -ti --rm \
#	  -e "DEPS=rabbitmq,couchdb"
#     -v /var/run/docker.sock:/var/run/docker.sock \
# 	  -v $(pwd):/repos/app \
#     callforamerica/docker-tests
