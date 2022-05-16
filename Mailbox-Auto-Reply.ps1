#This can be used alongside an Azure Automate Schedule to turn on users out of office on mailbox on certain days of the week
Param(
    [String]$Username
)

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-ExchangeOnline -Credential $AzureCredential

$Starttime = (Get-Date 00:01)#.AddHours(-10)
$EndTime = (Get-Date 23:59)#.AddHours(-10)

Set-MailboxAutoReplyConfiguration -Identity $Username -StartTime $Starttime -EndTime $EndTime -AutoReplyState Scheduled -Confirm:$false

Disconnect-ExchangeOnline -Confirm:$false

