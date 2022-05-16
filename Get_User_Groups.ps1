#Lists Groups a user is in
Param(
    [string]$Email
)
$AzureCredentials = Get-AutomationPSCredential -Name 'Powershell'
Connect-AzureAD -Credential $AzureCredentials | Out-Null
$GUID1 = Get-AzureADUser -ObjectId $Email | select ObjectID
$GUID = $GUID1.ObjectId

$Groups = Get-AzureADUserMembership -ObjectId $GUID | Select DisplayName

Write-Output $Groups | ConvertTo-JSON