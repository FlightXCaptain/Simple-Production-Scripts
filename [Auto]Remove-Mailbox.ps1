param (
    [string]$Mailbox,
    [String]$User
)

#This is for ExchangeOnline simply need to modify the Connect Section to work with a local exchange Server.

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-ExchangeOnline -Credential $AzureCredential

Remove-MailboxPermission -Identity $Mailbox -User $User -AccessRights FullAccess -Confirm:$false
Remove-RecipientPermission -Identity $Mailbox -Trustee $User -AccessRights SendAs -Confirm:$false

Disconnect-ExchangeOnline -Confirm:$false