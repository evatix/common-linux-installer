echo "make ins-devenv, if already not."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
bash ./brew-eval.sh
sudo apt update
sudo reboot