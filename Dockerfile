FROM node:dubnium-alpine
LABEL maintainer="Mark Lee <2woongjae@gmail.com>"

ENV AWS_CLI_VERSION 1.16.83
ENV DOCKER_COMPOSE_VERSION 1.23.2

RUN set -ex \
    && apk add --no-cache bash git openssl-dev openssh-client ca-certificates curl g++ libc6-compat \
    linux-headers make autoconf automake libtool python3 python3-dev libc6-compat \
    # Upgrade pip
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache-dir --upgrade pip setuptools \
    # Install AWS CLI
    && pip3 install awscli==${AWS_CLI_VERSION} \
    && aws --version \
    # Install Docker
    && apk add --no-cache docker \
    # Install Docker Compose
    && pip3 install docker-compose==${DOCKER_COMPOSE_VERSION}