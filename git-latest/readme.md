# Git Install

## CentOS 8.2 Git latest (Git 2.31 Install Linux CentOS 8.2.2004)

```bash
sudo su 
yum groupinstall -y 'Development Tools' && \
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-CPAN perl-devel && \
mkdir -p downloads && \
cd downloads && \
wget https://github.com/git/git/archive/refs/tags/v2.31.1.tar.gz && \
tar xf v2.31.1.tar.gz && \
rm -rf v2.31.1.tar.gz && \ 
cd git-2.31.1 && \
make configure && \
./configure --prefix=/usr/local && \
make all && \
make install && \
git version
```
