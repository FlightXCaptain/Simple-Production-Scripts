param (
    [parameter(mandatory = $true)]
    [string] $CalendarMailbox
)
$AzureCredential = Get-AutomationPSCredential -Name "Powershell"

Connect-ExchangeOnline -Credential $AzureCredential

Get-CalendarProcessing -Identity $CalendarMailbox | Select DeleteSubject,AddOrganizerToSubject

Set-CalendarProcessing -Identity $CalendarMailbox -DeleteSubject $False -AddOrganizerToSubject $False

Get-CalendarProcessing -Identity $CalendarMailbox | Select DeleteSubject,AddOrganizerToSubject 

Disconnect-ExchangeOnline -Confirm:$False