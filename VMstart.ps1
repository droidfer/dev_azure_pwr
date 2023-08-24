winrm quickconfig -Force
set-item WSMan:\localhost\Client\TrustedHosts "*" -Force
Enable-PSRemoting -Force