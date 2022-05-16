Param(
    [string]$DLEmail,
    [string]$User
)

$AzureCredentials = Get-AutomationPSCredential -Name 'Powershell'
Connect-ExchangeOnline -Credentials $AzureCredentials

Remove-DistributionGroupMember -Identity $DLEmail -member $User.PrimarySmtpAddress

Disconnect-ExchangeOnline