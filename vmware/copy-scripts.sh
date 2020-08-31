#!/bin/sh 

OsScriptsFolder="~/Desktop/scripts"
mkdir $OsScriptsFolder
cp -rf ./vm-mount.sh $OsScriptsFolder
sudo sudo chmod +x "$OsScriptsFolder/vm-mount.sh"
echo "if doesn't work then: crontab -e, add below"
echo "@reboot $OsScriptsFolder/vmware-mount-shared.sh"