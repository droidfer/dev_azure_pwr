# DevOps-Azure Powershell

## Features
- Login and Subscription on the script
- List Resources from a Resource Group defined
- List the configuration of Resource defined
- Add tags 'bootcamparroyo' to all resources of the defined resource group, and, print the tags of all resources

## Configuration
For the configuration, there are enviroment variables that needs to be set

### SUBSCRIPTION ID
The subscription ID must be set this way (ex: 123-123-123)

`$Env:Subs = '123-123-123'`

### RESOURCE GROUP
The Resource Group must be set this way (ex: BootCamp)

`$Env:RG = 'BootCamp'`

### RESOURCE
The Resource must be set this way (ex: Server)

`$Env:Res = 'Server'`