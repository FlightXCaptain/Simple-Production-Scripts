Param(
    [string]$DLEmail,
    [string]$User
)

$AzureCredentials = Get-AutomationPSCredential -Name 'Powershell'
Connect-ExchangeOnline -Credentials $AzureCredentials

Add-DistributionGroupMember -Identity $DLName -member $User.PrimarySmtpAddress

Disconnect-ExchangeOnline