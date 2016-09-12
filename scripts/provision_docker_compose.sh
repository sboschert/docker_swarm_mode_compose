#!/bin/sh

COMPOSE_VERSION=1.8.0

# Install prerequisite packages
DEBIAN_FRONTEND=noninteractive apt-get -y install \
    curl

# Download docker-compose and make it executable
curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` \
    > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
