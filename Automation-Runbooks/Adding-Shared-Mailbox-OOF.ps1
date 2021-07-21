#This sets a message for a shared mailbox for a set date in the future. Great for the holiday season.
param (
    [string]$Mailbox,
    [string]$StartDate,
    [string]$EndDate,
    [string]$Message
)
$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'
Connect-ExchangeOnline -Credential $AzureCredential
$Startdate1 = $StartDate.AddHours(-8)
$Enddate1 = $EndDate.AddHours(-8)
Set-MailboxRegionalConfiguration -Identity $Mailbox -TimeZone "W. Australia Standard Time" -Language "en-US" -DateFormat "dd-MMM-yy"

Set-MailboxAutoReplyConfiguration -Identity $Mailbox -AutoReplyState Scheduled -StartTime $StartDate1 -EndTime $EndDate1 -InternalMessage $Message -ExternalMessage $Message 