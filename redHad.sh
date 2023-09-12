dnf install telnet -y
dnf install java-1.8.0-openjdk -y
dnf install lvm2 -y
dnf install tree -y
dnf install psmisc -y
dnf install icu -y
dnf install sshpass -y
dnf install python36 -y
dnf install python3-lxml  -y
dnf install dos2unix git -y

curl https://github.com/droidfer.keys | tee -a ~/.ssh/authorized_keys
