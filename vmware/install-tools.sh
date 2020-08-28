# Guest install in debian and other linux

yes | sudo apt-get install open-vm-tools
sudo apt update
/usr/bin/vmware-toolbox-cmd -v
sudo sh ./vmware-mount-shared-first.sh
sudo apt update