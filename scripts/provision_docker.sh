#!/bin/sh

# Set up sudo for vagrant user
#echo %vagrant ALL=NOPASSWD:ALL > /etc/sudoers.d/vagrant
#chmod 0440 /etc/sudoers.d/vagrant

# Add the vagrant user to the sudo group
#usermod -a -G sudo vagrant

# Install prerequisite packages
DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https \
    ca-certificates

# Install docker GPG key
apt-key adv \
    --keyserver hkp://p80.pool.sks-keyservers.net:80 \
    --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Crea
tee /etc/apt/sources.list.d/docker.list <<-EOF
deb https://apt.dockerproject.org/repo ubuntu-xenial experimental
EOF

# Install docker-engine
DEBIAN_FRONTEND=noninteractive apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y install docker-engine

# Start docker-engine
systemctl enable --now docker

# Add the vagrant user to the docker group
usermod -a -G docker vagrant
