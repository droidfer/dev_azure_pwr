winrm quickconfig -Force

$myIP = (Invoke-WebRequest -uri "https://api.ipify.org/").Content
$Cert = New-SelfSignedCertificate -DnsName $myIP -CertStoreLocation Cert:\LocalMachine\My
$thumb = $Cert.Thumbprint
$params = '@{Hostname="' + $myIp + '"; CertificateThumbprint="' + $thumb + '"}'
winrm create winrm/config/Listener?Address=*+Transport=HTTPS $params

set-item WSMan:\localhost\Client\TrustedHosts "*" -Force
Enable-PSRemoting -Force