param (
    [string]$token = 'not_token',
    [string]$poolSet = 'FkPool',
    [string]$agentName = 'vmWin'
)

Set-Location c:
mkdir dwn

$URL="https://vstsagentpackage.azureedge.net/agent/3.225.0/vsts-agent-win-x64-3.225.0.zip"
$Path=“C:\dwn\vsts-agent-win-x64-3.225.0.zip"

(New-Object System.Net.WebClient).DownloadFile($URL, $Path)

mkdir agent ; Set-Location agent

Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory($Path, "$PWD")
.\config.cmd --unattended --url https://dev.azure.com/ArroyoTraining/ --auth pat --token $token --pool $poolSet --agent $agentName --work _work --runAsService N --runAsAutoLogon N

.\run.cmd
