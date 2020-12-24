#!/bin/bash

sudo apt-get update
mkdir -p ~/scripts
cd ~/scripts
sudo curl -fsSL https://get.docker.com -o get-docker.sh | sh
sudo apt-get update
docker --version
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
newgrp - docker

docker run hello-world

## Docker machine install

base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
docker-machine version