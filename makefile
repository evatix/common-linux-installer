VsCodeShell = "./vscode/vscode.sh"
ChromeShell = "./chrome/chrome.sh"
VmwareFolder = "./vmware/"
GitFolder = "./git-latest/"
MouseWheel = "./mousewheel/"
BrewFolder = "./brew-installer/"

git-clean-get:
	git reset --hard
	git clean -df
	git status
	git pull

update:
	sudo apt update

ins-mwheel:
	sudo apt-get install imwheel
	make update

fix-mwheel:
	echo "set 6"
	cd $(MouseWheel) && sudo sh ./fix.sh

ins-devenv:
	echo "Installing apt-get install build-essential wget curl file git ssh libssl-dev vim autoremove python-dev python-pip imwheel"
	yes | sudo apt-get install build-essential curl wget file git ssh libssl-dev vim autoremove python-dev python-pip imwheel
	make update

ins-scoop:
	make ins-devenv
	yes | pip install scoop

ins-golang:
	echo "brew install go, install brew first (make ins-brew)"
	brew install go
	make update

ins-vlc:
	echo "yes | brew install vlc"
	yes | brew install vlc

ins-brew:
	cd $(BrewFolder) && bash ./brew-ins.sh

fix-brew:
	cd $(BrewFolder) && bash ./brew-eval.sh

ins-git:
	cd $(GitFolder) && bash ./git.sh

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
	yes | wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

ins-cent-ozsh:
	yes | wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

ins-li-ch-zsh:
	chsh -s $(which zsh) -root
	chsh -s `which zsh`

ins-vmguest:
	cd $(VmwareFolder) && make install-guest

vm-mount-script-copy:
	cd $(VmwareFolder) && sh ./copy-scripts.sh

vm-mount-shared:
	cd $(VmwareFolder) && make mount-shared
