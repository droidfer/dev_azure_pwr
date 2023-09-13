#Installs
sudo dnf install telnet java-1.8.0-openjdk lvm2 tree psmisc icu sshpass python36 python3-lxml dos2unix git -y

#Public app keys in the VM
sudo curl https://github.com/droidfer.keys | tee -a /home/redHatArroyo/.ssh/authorized_keys