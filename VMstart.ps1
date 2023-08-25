Enable-PSRemoting -Force

New-NetFirewallRule -Name "Allow WinRM HTTPS" -DisplayName "WinRM HTTPS" -Enabled True -Profile Any -Action Allow -Direction Inbound -LocalPort 5986 -Protocol TCP

$setip = "myvm.eastus2.cloudapp.azure.com"

$thumbprint = (New-SelfSignedCertificate -DnsName $setip -CertStoreLocation Cert:\LocalMachine\My).Thumbprint

$command = "winrm create winrm/config/Listener?Address=*+Transport=HTTPS @{Hostname=""$setip""; CertificateThumbprint=""$thumbprint""}"
cmd.exe /C $command

# $myIPcomplex = (Invoke-WebRequest -uri "https://api.ipify.org/").Content
# $myIP = $myIPcomplex.ToString()
# Write-Output "Configure IP" $myIp

# $Cert = New-SelfSignedCertificate -DnsName $myIP -CertStoreLocation Cert:\LocalMachine\My
# $thumb = $Cert.Thumbprint.ToString()
# Write-Output "Certification" $thumb 


# $params = '@{Hostname="' + $myIp + '"; CertificateThumbprint="' + $thumb + '"}'
# Write-Output "WinRM Params" $params 

# winrm create winrm/config/Listener?Address=*+Transport=HTTPS $params


# winrm quickconfig -Force


# set-item WSMan:\localhost\Client\TrustedHosts "*" -Force
# Enable-PSRemoting -Force

# Set-NetFirewallProfile -All -Enabled False