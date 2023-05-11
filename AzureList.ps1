<# Login #>
az login

<# Select the subscription #>
<# This step requires the creation of environment variable Subs #>
az account set --subscription $Env:Subs

<# Connect #>
Connect-AzAccount

<# Get Resource Group in Format Table #>
<# This step requires the creation of environment variable RG #>
$resources = Get-AzResource -ResourceGroupName $Env:RG
$resources | Format-Table

<# Get Resource Group in Format Table #>
<# This step requires the creation of environment variable Res #>
Get-AzResource -Name $Env:Res | Format-List

<# Add Tags to resources of Resource Group selected #>
$resources | ForEach-Object { New-AzTag -Tag @{ "Env"="bootcamparroyo" } -ResourceId $_.ResourceId }

<# View the Tags #>
<# First, refresh the variable $resources #>
$resources = Get-AzResource -ResourceGroupName $Env:RG

<# Then print the tags #>
$resources.Tags