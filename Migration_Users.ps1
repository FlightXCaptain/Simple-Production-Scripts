#param (
#    [Parameter(Mandatory=$true)]
#    [string]$UPN
#)
$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-MsolService -Credential $AzureCredential

$Users = Get-MsolUser -All -ReturnDeletedUsers
$Users | ForEach-Object{Restore-MsolUser -ObjectId $_.ObjectId | Set-MsolUser -ImmutableId "$null"}  

#Restore-MsolUser -UserPrincipalName $UPN 
#Set-MsolUser -UserPrincipalName $UPN -ImmutableId "$null"