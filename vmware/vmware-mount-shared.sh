sudo apt update
/usr/bin/vmhgfs-fuse --enabled
sudo vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other 
ln -s /mnt/hgfs ~/Desktop/SharedDirectories 
cd ~/Desktop/SharedDirectories
# add to startup
# https://serverfault.com/questions/735621/debian-how-to-run-a-script-on-startup-without-having-to-write-30-lines-of-shell
crontab -l
cp -rf ./ ~/Desktop/vmware