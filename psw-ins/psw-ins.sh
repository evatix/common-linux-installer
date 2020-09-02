echo "https://bit.ly/2YZXmzy"
echo "https://bit.ly/2Z1TGgG"

wget http://mirrors.edge.kernel.org/ubuntu/pool/main/i/icu/libicu60_60.2-3ubuntu3_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
sudo dpkg -i libicu60_60.2-3ubuntu3_amd64.deb libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository "deb http://ftp.de.debian.org/debian stretch main"
# Enable the "universe" repositories
sudo add-apt-repository universe
# Update the list of products
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
pwsh