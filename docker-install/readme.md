# Docker Install

## Signed Issues

- [ubuntu - Repository is not signed in docker build - Stack Overflow](https://stackoverflow.com/questions/59139453/repository-is-not-signed-in-docker-build)
- [How To Delete A Repository And GPG Key In Ubuntu - OSTechNix](https://ostechnix.com/how-to-delete-a-repository-and-gpg-key-in-ubuntu/#:~:text=To%20delete%20a%20software%20repository,repository%20entry%20and%20delete%20it.&text=As%20you%20can%20see%20in,repository%20in%20my%20Ubuntu%20system.&text=To%20delete%20this%20repository%2C%20simply%20remove%20the%20entry.)
- [Get Docker | Docker Documentation](https://docs.docker.com/get-docker/)

## Install

- [common-linux-installer/makefile at master · Evatix/common-linux-installer](https://github.com/Evatix/common-linux-installer/blob/master/makefile)
- [Docker Install - HackMD](https://hackmd.io/@akarimevatix/HJ4jmnjVv)
- [common-linux-installer/docker-ins.sh at master · Evatix/common-linux-installer](https://github.com/Evatix/common-linux-installer/blob/master/docker-install/docker-ins.sh)
- [Install Docker Engine | Docker Documentation](https://docs.docker.com/engine/install/)
- [Install Docker Engine on Ubuntu | Docker Documentation](https://docs.docker.com/engine/install/ubuntu/)
- [https://get.docker.com](https://get.docker.com/)
- [How Do I upgrade Docker - Ask Ubuntu](https://askubuntu.com/questions/472412/how-do-i-upgrade-docker)
- [bash - Permission denied to Docker daemon socket at unix:///var/run/docker.sock - Stack Overflow](https://stackoverflow.com/questions/53126950/permission-denied-to-docker-daemon-socket-at-unix-var-run-docker-sock)
- [Ubuntu: All docker](https://gitlab.com/evatix-go/os-manuals/-/issues/2)
- [Docker Install Using Snap](https://github.com/docker-archive/docker-snap)

## Instructions

### Remove old docker

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

Or,

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo apt clean
```

### [Easiest Way : get.docker.com](https://get.docker.com/)

```bash
mkdir -p ~/scripts
cd ~/scripts
sudo curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh
docker --version
```

### Use Docker without `su`

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
newgrp - docker
docker run hello-world

```

if user name is `a`

```bash
sudo usermod -aG docker a
```

### [Snap Install](https://github.com/docker-archive/docker-snap)

```bash
sudo snap install docker
sudo snap connect docker:home
sudo addgroup --system docker
sudo adduser $USER docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock
newgrp docker
sudo snap disable docker
sudo snap enable docker
docker --version
docker run hello-world
```
