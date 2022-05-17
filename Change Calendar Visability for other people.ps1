#For Local Exchange
#$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential Get-Credential -Authentication Basic -AllowRedirection
#Import-PSSession $Session

#For ExchangeOnline https://docs.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps
#Import-Module ExchangeOnlineManagement
#Connect-ExchangeOnline

Set-MailboxFolderPermission -Identity ExampleMailbox:\calendar -User default -AccessRights LimitedDetails

#Use this instead to allow everyone to see Subject aswell
#Set-CalendarProcessing -Identity Meetingroom -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false