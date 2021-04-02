#!/bin/sh

OUTPUT=$(cat /etc/*release)
cat OUTPUT
sudo apt install -y -qq wget curl
SERVER_OS="Ubuntu"
rm -f cyberpanel.sh
rm -f install.tar.gz
curl --silent -o cyberpanel.sh "https://cyberpanel.sh/?dl&$SERVER_OS" 2>/dev/null
chmod +x cyberpanel.sh
./cyberpanel.sh $@
