Enable-PSRemoting -Force

New-NetFirewallRule -Name "Allow WinRM HTTPS" -DisplayName "WinRM HTTPS" -Enabled True -Profile Any -Action Allow -Direction Inbound -LocalPort 5986 -Protocol TCP

$setip = "myvm.eastus2.cloudapp.azure.com"

$thumbprint = (New-SelfSignedCertificate -DnsName $setip -CertStoreLocation Cert:\LocalMachine\My).Thumbprint

$command = "winrm create winrm/config/Listener?Address=*+Transport=HTTPS @{Hostname=""$setip""; CertificateThumbprint=""$thumbprint""}"
cmd.exe /C $command