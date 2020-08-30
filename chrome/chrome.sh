sudo apt update 
FILE=./google-chrome-stable_current_amd64.deb 
if ![test -f "$FILE"]; then 
    echo "$FILE doesn't exist so downloading." 
    # https://stackoverflow.com/questions/1078524/how-to-specify-the-location-with-wget
    wget -p "/home/$USER/Downloads/chrome" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
else 
    echo "file exist" 
    ls | grep "chrome" 
fi 

yes | sudo apt --fix-broken install ./google-chrome-stable_current_amd64.deb 
sudo apt update 