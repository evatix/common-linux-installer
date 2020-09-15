#!/bin/bash

echo "make ins-devenv, if already not."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
sh ./brew-eval.sh
echo "https://github.com/Linuxbrew/brew"
# https://docs.brew.sh/Homebrew-on-Linux
echo "Visit: https://docs.brew.sh/Homebrew-on-Linux"
echo "Packages: https://formulae.brew.sh/formula-linux/"
sudo apt update
brew --version
brew install hello
echo "do sudo reboot"