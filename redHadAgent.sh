# Public app keys in the VM
sudo curl https://github.com/droidfer.keys | tee -a /home/redHatArroyo/.ssh/authorized_keys

# Login as user
su redHatArroyo

# Download and Install VTST Agent
mkdir /home/redHatArroyo/dwn
curl https://vstsagentpackage.azureedge.net/agent/3.225.0/vsts-agent-linux-x64-3.225.0.tar.gz > /home/redHatArroyo/dwn/vsts-agent-linux-x64-3.225.0.tar.gz