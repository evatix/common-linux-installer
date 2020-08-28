VsCodeShell = "./vscode/vscode.sh"
ChromeShell = "./chrome/chrome.sh"
VmwareFolder = "./vmware/"

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
	chsh -s $(which zsh) -root
	chsh -s `which zsh`

ins-vmguest:
	cd $(VmwareFolder) && make install-guest

vm-mount-script-copy:
	cd $(VmwareFolder) && cp -rf ./vmware-mount-shared.sh ~/Desktop/vmware/
	sudo chmod +x ~/Desktop/vmware/vmware-mount-shared.sh
	sudo update-rc.d ~/Desktop/vmware/vmware-mount-shared.sh defaults

vm-mount-shared:
	cd $(VmwareFolder) && make mount-shared