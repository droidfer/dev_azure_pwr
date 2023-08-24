Start-Sleep -Seconds 120

$myIPcomplex = (Invoke-WebRequest -uri "https://api.ipify.org/").Content
$myIP = $myIPcomplex.ToString()
Write-Output "Configure IP" $myIp

$Cert = New-SelfSignedCertificate -DnsName $myIP -CertStoreLocation Cert:\LocalMachine\My
$thumb = $Cert.Thumbprint
Write-Output "Certification" $thumb 


$params = '@{Hostname="' + $myIp + '"; CertificateThumbprint="' + $thumb + '"}'
Write-Output "WinRM Params" $params 

winrm create winrm/config/Listener?Address=*+Transport=HTTPS $params


winrm quickconfig -Force


set-item WSMan:\localhost\Client\TrustedHosts "*" -Force
Enable-PSRemoting -Force

Set-NetFirewallProfile -All -Enabled False