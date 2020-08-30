sudo apt-get install fonts-powerline
sudo apt install net-tools
sudo install wget
sudo install curl
sudo apt update
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
sudo apt-get install build-essential libssl-dev
sudo apt install zsh
pwd
yes | cp -rf .zshrc ~/.zshrc
sudo apt update
source ~/.zshrc
cat ~/.zshrc
chsh -s `which zsh`
sudo chsh -s `which zsh` root
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
yes | cp -rf .zshrc ~/.zshrc
sudo apt update
source ~/.zshrc
cat ~/.zshrc
chsh -s `which zsh`
read -n 1 -p "Press any key to reboot the OS . . ."
sudo reboot
