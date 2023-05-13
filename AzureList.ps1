<# ------------------------------------------------------ #>
<# Login and Authetication #>

<# Login #>
az login;

<# Select the subscription #>
<# This step requires the creation of environment variable Subs #>
az account set --subscription $Env:Subs;

<# Connect #>
Connect-AzAccount;

<# ------------------------------------------------------ #>
<# List Resources from Resource Group #>

<# Get Resource Group in Format Table #>
<# This step requires the creation of environment variable RG #>
$resources = Get-AzResource -ResourceGroupName $Env:RG;
$resources | Format-Table;


<# ------------------------------------------------------ #>
<# LIST Different types of resource in the resource group #>

<# Storage #>
Get-AzStorageAccount -ResourceGroupName $Env:RG  | Format-List;

<# KeyVault #>
Get-AzKeyVault -ResourceGroupName $Env:RG | Format-List;

<# Web Appt #>
Get-AzWebApp -ResourceGroupName $Env:RG | Format-List;

<# MySql Server #>
Get-AzMySqlServer -ResourceGroupName $Env:RG | Format-List;

<# Container App #>
Get-AzContainerApp -ResourceGroupName $Env:RG | Format-List;

<# ------------------------------------------------------ #>
<# TAGS #>

<# Add Tags to resources of Resource Group selected #>
$resources | ForEach-Object { New-AzTag -Tag @{ "Env"="bootcamparroyo" } -ResourceId $_.ResourceId };

<# View the Tags #>
<# First, refresh the variable $resources #>
$resources = Get-AzResource -ResourceGroupName $Env:RG;

<# Then print the tags #>
$resources.Tags;