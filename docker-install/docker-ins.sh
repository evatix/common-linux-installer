#!/bin/bash

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 
sudo apt-get update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version
sudo apt-get update
docker run hello-world
docker run -it ubuntu bash
sudo apt clean