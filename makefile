VsCodeShell = "./vscode/vscode.sh"
ChromeShell = "./chrome/chrome.sh"
VmwareFolder = "./vmware/"
GitFolder = "./git-latest/"
MouseWheel = "./mousewheel/"
BrewFolder = "./brew-installer/"
PyPipFolder = "./py-pip-ins/"
PowerShellFolder = "./psw-ins/"
DockerFolder = "./docker-install/"

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
	echo "Installing apt-get install vim build-essential wget curl file git ssh libssl-dev vim"
	yes | sudo apt-get install vim build-essential wget curl file git ssh libssl-dev
	make update

ins-centos-devenv:	
        # libcurl-devel for git
	sudo su
	yum update
	dnf update
	yum groupinstall -y 'Development Tools'
	yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-CPAN perl-devel
	yum install -y vim build-essential wget curl file git ssh libssl-dev libcurl-devel pcre pcre-devel zlib zlib-devel openssl openssl-devel
	yum update
	dnf update	

ins-devenv-entend:
	echo "Installing sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools"
	yes | sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools
	make update

ins-devenv-ubuntu:
	make ins-devenv
	echo "Installing apt-get autoremove python-dev python2 imwheel"
	yes | sudo apt-get install autoremove python-dev python2 imwheel
	make update

ins-snapd:
	sudo apt install snapd
	
ins-snapd:
	sudo apt install snapd

ins-centos-snapd:
	# https://snapcraft.io/docs/installing-snap-on-centos
	yes | sudo yum install epel-release
	sudo yum install snapd
	sudo systemctl enable --now snapd.socket
	sudo ln -s /var/lib/snapd/snap /snap

fix-pip:
	cd $(PyPipFolder) && sh pip-install.sh

ins-golang:
	echo "brew install go, install brew first (make ins-brew)"
	brew install go
	make update
	go version
	
ins-zsh:
	# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
	yes | sudo apt install zsh
	zsh --version	

ins-golang-snap:
	sudo snap install go --classic
	go version

ins-clask-vlc:
	echo "brew clask install vlc"
	brew clask install vlc

ins-ps:
	cd $(PowerShellFolder) && sudo bash ./psw-ins.sh

ins-docker:
	echo "https://hackmd.io/@akarimevatix/HJ4jmnjVv"
	echo "https://gitlab.com/evatix-go/os-manuals/-/issues/2"
	echo "Docker can also be installed using snapd"
	cd $(DockerFolder) && bash ./docker-ins.sh

ins-docker-new:
	echo "https://hackmd.io/@akarimevatix/HJ4jmnjVv"
	echo "https://gitlab.com/evatix-go/os-manuals/-/issues/2"
	echo "Docker can also be installed using snapd"
	sudo apt-get install docker-ce

ins-brew:
	cd $(BrewFolder) && bash ./brew-ins.sh
	echo "https://formulae.brew.sh/formula-linux/"
	brew --version

cat-brew-fix:
	clear
	cd $(BrewFolder) && cat ./brew-eval.sh
	read -p "Press enter to continue"

fix-brew:
	make cat-brew-fix
	cd $(BrewFolder) && bash ./brew-eval.sh
	brew --version

ins-git:
	cd $(GitFolder) && sh ./git.sh
	git --version

ins-wget:
	yes | sudo apt install wget

ins-curl:
	yes | sudo apt install curl

edit-omzsh-source:
	vim ~/.zshrc
	echo ""
	source ~/.zshrc

sudo-edit-omzsh-source:
	sudo vim ~/.zshrc
	echo ""
	source ~/.zshrc

ins-vscode:
	sudo sh $(VsCodeShell)

ins-chrome:
	yes | sudo sh $(ChromeShell)

install-ssh-pass-linux:
	sudo su
	apt update	
	yes | apt install openssh-server openssh-client sshpass	
	yes | apt update
	systemctl enable sshd
	systemctl status ssh
	systemctl restart sshd
	systemctl status sshd
	sudo ufw allow ssh	
	systemctl status sshd

install-centos-ssh:
	echo "https://linuxconfig.org/redhat-8-enable-ssh-service | https://linuxhint.com/enable_ssh_centos8/"
	sudo su-
	yes | yum install openssh-server sshpass net-tools
	ufw allow ssh
	systemctl enable sshd
	systemctl restart sshd
	firewall-cmd --zone=public --permanent --add-service=ssh
	netstat -tpln | egrep '(Proto|ssh)'
	systemctl status sshd

ssh-port:
	echo "https://bit.ly/3lpPAId"
	sudo grep Port /etc/ssh/sshd_config 
	sudo netstat -lntp
	sudo lsof -Pi | grep ssh
	ip address
	sudo netstat -tpln | egrep '(Proto|ssh)'

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
	yes | git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ins-cent-ozsh:
	yes | wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
	yes | git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ins-li-ch-zsh:
	chsh -s $(which zsh) -root
	chsh -s `which zsh`

ins-vmguest:
	cd $(VmwareFolder) && make install-guest

vm-mount-script-copy:
	cd $(VmwareFolder) && sh ./copy-scripts.sh

vm-mount-shared:
	cd $(VmwareFolder) && make mount-shared

cat-ssh:
	cat ~/.ssh/id_rsa.pub

ssh-sample:
	echo "ssh-keygen -t rsa -b 4096 -C 'Your email'"
	
modify-authorized-keys:
	sudo vim ~/.ssh/authorized_keys

vimsetline:
	echo "https://stackoverflow.com/a/42619212"
	rm -rf ~/.vimrc
	echo "set number" >> ~/.vimrc
	echo "syntax on" >> ~/.vimrc
