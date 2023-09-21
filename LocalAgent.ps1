Param (
    [string]$token,
    [string]$poolSet,
    [string]$agentName
)

# Crear archivo de trabajo
New-Item -ItemType Directory c:\agent

# Descargar Archivo a instalar
$URL="https://vstsagentpackage.azureedge.net/agent/3.225.0/vsts-agent-win-x64-3.225.0.zip"
$Path="c:\agent\vsts-agent-win-x64-3.225.0.zip"
(New-Object System.Net.WebClient).DownloadFile($URL, $Path)

# Extraer archivo de zip
Expand-Archive -LiteralPath 'c:\agent\vsts-agent-win-x64-3.225.0.zip' -DestinationPath C:\agent

# Ejecutar comando
c:\agent\config.cmd --unattended --url https://dev.azure.com/ArroyoTraining/ --auth pat --token $token --pool $poolSet --agent $agentName --work _work --runAsService N --runAsAutoLogon N

# Iniciar
c:\agent\run.cmd
