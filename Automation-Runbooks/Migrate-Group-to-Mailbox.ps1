param (
    [string]$OnlineMailbox,
    [String]$Group
)
#This is for migrating users from a group to an online mailbox directly. Primarily in preparation for an AD migration to the cloud
$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-ExchangeOnline -Credential $AzureCredential
Connect-AzureAD -Credential $AzureCredential

$ObjectID1 = Get-AzureADGroup -SearchString $Group | Select -First 1
$ObjectID = $ObjectID1.ObjectId

$GroupMembers1 = Get-AzureADGroupMember -ObjectId $ObjectID
$GroupMembers = $GroupMembers1.UserPrincipalName

ForEach ($User in $GroupMembers)
{
    Add-MailboxPermission -Identity $OnlineMailbox -User $User -AccessRights FullAccess
    Add-RecipientPermission -Identity $OnlineMailbox -Trustee $User -AccessRights SendAs -Confirm:$false
}
Disconnect-ExchangeOnline -Confirm:$false