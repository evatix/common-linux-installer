#!/bin/bash
pwd
echo $USER
# user=$USER
# echo "user: $USER"
# echo "uid: $UID"
# echo "whoami: $whoami"
# cat /etc/passwd | cut -d":" -f1,3
#https://bit.ly/3gIJCPE
# currentDir="/home/$user/Downloads/temp"
# echo $currentDir
# mkdir $currentDir
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get install git
git version

## centos https://gist.github.com/egorsmkv/30faa3e61c185a41e89cf849737d4d4b
sudo su
yum groupinstall 'Development Tools'
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-CPAN perl-devel

mkdir -p downloads
cd downloads
wget https://github.com/git/git/archive/refs/tags/v2.31.1.tar.gz
tar xf v2.31.1.tar.gz
cd v2.31.1
make configure
./configure --prefix=/usr/local
make all
make install
cd ..

pwd
