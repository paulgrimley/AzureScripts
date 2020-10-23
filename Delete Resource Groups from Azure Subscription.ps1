#This script recursively deletes resource groups within an Azure subscription
#Note this will not delete resource groups that have locks on them
#Login to Azure
az login

#List subsctiptions
az account list --output table

#Select subscription to delete resource within
az account list --output table
az account set --subscription "<insert subscription name or id here>"

#Please be careful running the commands in the next section as this will delete resources in every resource group associated with the subscription you've selected above
#Please make sure you have the right subscription selected before continuing
#If you are unsure if you have the correct subscription please check before continuing
#Note for Get-AzResourceGroup you can add -Name to specify certain resource groups to delete e.g. -Name Dev*
$rgs = Get-AzResourceGroup 
foreach ($rg in $rgs) { Remove-AzResourceGroup -Name $rg.ResourceGroupName -force }