sudo yum-get install fonts-powerline
sudo yum install net-tools
sudo yum install wget
sudo yum install curl
sudo yum update
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
yum-get install build-essential libssl-dev
sudo yum install zsh
pwd
yes | cp -rf .zshrc ~/.zshrc
sudo yum update
source ~/.zshrc
cat ~/.zshrc
chsh -s `which zsh`
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
yes | cp -rf .zshrc ~/.zshrc
sudo yum update
source ~/.zshrc
cat ~/.zshrc
chsh -s `which zsh`
read -n 1 -p "Press any key to reboot the OS . . ."
sudo reboot
