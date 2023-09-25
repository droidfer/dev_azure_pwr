#Public app keys in the VM
sudo curl https://github.com/droidfer.keys | tee -a /home/redHatArroyo/.ssh/authorized_keys

# Donwload and Install VTST Agent
mkdir /home/redHatArroyo/myagent
curl https://vstsagentpackage.azureedge.net/agent/3.225.0/vsts-agent-linux-x64-3.225.0.tar.gz > /home/redHatArroyo/myagent/vsts-agent-linux-x64-3.225.0.tar.gz
tar zxvf /home/redHatArroyo/myagent/vsts-agent-linux-x64-3.225.0.tar.gz -C /home/redHatArroyo/myagent/

# Configure Agent
/home/redHatArroyo/myagent/config.sh --unattended --url https://dev.azure.com/ArroyoTraining/ --auth pat --token $0 --pool $1 --agent $2

# Start Agent
/home/redHatArroyo/myagent/run.sh
