# Public app keys in the VM
sudo curl https://github.com/droidfer.keys | tee -a /home/redHatArroyo/.ssh/authorized_keys

# Login as user
su redHatArroyo

# Download and Install VTST Agent
mkdir /home/redHatArroyo/myagent
