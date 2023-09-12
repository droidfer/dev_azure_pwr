#Installs
sudo dnf install telnet -y
sudo dnf install java-1.8.0-openjdk -y
sudo dnf install lvm2 -y
sudo dnf install tree -y
sudo dnf install psmisc -y
sudo dnf install icu -y
sudo dnf install sshpass -y
sudo dnf install python36 -y
sudo dnf install python3-lxml  -y
sudo dnf install dos2unix git -y

#Public app keys in the VM
sudo curl https://github.com/droidfer.keys | tee -a ~/.ssh/authorized_keys
