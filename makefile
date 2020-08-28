VsCodeShell = "./vscode/vscode.sh"
ChromeShell = "./chrome/chrome.sh"

git-clean-get:
	git reset --hard
	git clean -df
	git status
	git pull

ins-wget:
	yes | sudo apt install wget

ins-curl:
	yes | sudo apt install curl

ins-vscode:
    sudo sh $(VsCodeShell)

ins-chrome:
	yes | sudo sh $(ChromeShell)

install-ssh-pass-linux:
	sudo apt-get install sshpass
	sudo apt update

ins-li-fonts:
	yes | sudo apt-get install fonts-powerline

ins-cent-fonts:
	yes | sudo yum-get install fonts-powerline

ins-cent-build:
	yes | yum-get install build-essential libssl-dev

ins-li-build:
	yes | sudo apt-get install build-essential libssl-dev

ins-li-ozsh:
	yes | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit

ins-cent-ozsh:
	yes | sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && exit

ins-li-ch-zsh:
	chsh -s $(which zsh)
	chsh -s `which zsh`

cp-zsh:
	cd $(LChapter01) && yes | cp -rf .zshrc ~/
	cat ~/.zshrc
	pwd
	source ~/.zshrc