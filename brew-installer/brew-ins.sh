#!/bin/bash

# Include files.
. ../shared/brew-service-helper.sh

echo "make ins-devenv, if not already."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
bash ./brew-eval.sh
echo "https://github.com/Linuxbrew/brew"
# https://docs.brew.sh/Homebrew-on-Linux
echo "Visit: https://docs.brew.sh/Homebrew-on-Linux"
echo "Packages: https://formulae.brew.sh/formula-linux/"
sudo apt update

eval $(~/.linuxbrew/bin/brew shellenv)
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

create_and_run_service cp brew-service ./brew-service.service 
# sudo cp brew-service.service /etc/systemd/system/brew-service.service

brew --version
brew install hello
info "creating brew os startup service"
create_brew_service

echo "do sudo reboot"