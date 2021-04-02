#!/bin/bash

# reference : https://golang.org/doc/install

mkdir downloads
cd downloads
wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
cd ..
rm -rf downloads
