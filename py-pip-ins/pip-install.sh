echo "https://bit.ly/3bmMH78"
sudo add-apt-repository universe
sudo apt update && sudo apt install python2
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py
pip2 --version