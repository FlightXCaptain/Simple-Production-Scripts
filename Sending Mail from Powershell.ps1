$Password = 'EnterPasswordHere'
$name = 'Enter From Email Here'
$Subject = 'Subject Line'
$Body = 'Enter body of email here'
$To = 'Sending to Email Address'
$pass = $Password | ConvertTo-SecureString -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($name,$pass)
Send-MailMessage -To $To -SmtpServer smtp.office365.com -Credential $cred -From $name -Subject $Subject -UseSsl -Body $Body
#there is a variation to send as someone else but you need to have SendAs permissions on their mailbox then just change the -From Variable.