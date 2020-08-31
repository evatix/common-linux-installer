sudo apt update 
FILE=./google-chrome-stable_current_amd64.deb 
ParentDirectory= /home/$USER/Downloads/chrome
mkdir ParentDirectory
Path = "$ParentDirectory/$FILE"
if test -f "$Path"; then 
    echo "$Path already present." 
    ls | grep "chrome" 
else 
    echo "$Path doesn't exist so downloading." 
    # https://stackoverflow.com/questions/1078524/how-to-specify-the-location-with-wget
    wget -p "/home/$USER/Downloads/chrome" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi 

yes | sudo apt --fix-broken install $Path
sudo apt update 