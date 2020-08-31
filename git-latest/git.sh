#!/bin/bash
pwd
echo $USER
user=$USER
echo "user: $USER"
echo "uid: $UID"
echo "whoami: $whoami"
# cat /etc/passwd | cut -d":" -f1,3
#https://bit.ly/3gIJCPE
currentDir="/home/$user/Downloads/temp"
echo $currentDir
# mkdir $currentDir
cd $currentDir
ls -la
pwd