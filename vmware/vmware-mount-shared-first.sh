#!/bin/sh 

sudo apt update
sh ./vmware-mount-shared.sh
ls -la
cat /etc/os-release
lsb_release -a