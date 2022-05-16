param (
    [string]$Calendar,
    [string]$User
)

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-ExchangeOnline -Credential $AzureCredential

Set-MailboxFolderPermission -Identity $Calendar':\calendar' -User $User -AccessRights LimitedDetails

#Use this instead to allow everyone to see Subject aswell
#Set-CalendarProcessing -Identity Meetingroom -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false