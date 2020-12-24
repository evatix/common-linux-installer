#!/bin/bash

sudo apt-get update
mkdir -p ~/scripts
cd ~/scripts
sudo curl -fsSL https://get.docker.com -o get-docker.sh | sh
docker --version
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
newgrp - docker
docker run hello-world