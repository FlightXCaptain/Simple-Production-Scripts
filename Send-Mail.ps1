$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

$To = '#To Email'
$From = '#From Email'
$Body = 'TestBody'
$Subject = 'test'

Send-MailMessage -From $From -To $To -Body $Body -Subject $Subject -SmtpServer 'smtp.office365.com' -UseSSL -Credential $AzureCredential -Port '587'

