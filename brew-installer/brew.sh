cd ..
echo "make ins-devenv, if already not."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd "/brew-installer"
brew
sudo apt update
sudo reboot