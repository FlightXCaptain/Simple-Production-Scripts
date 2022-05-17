# Changes the priority matrix for the vpn net adapter to be the highest and sets default app for .ps1 to powershell

$username = #'domain\adminaccount'
$password = #''
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Set-ExecutionPolicy Bypass -Scope CurrentUser
Start-Process Powershell.exe -Credential $credential
Get-NetAdapter -InterfaceDescription "TAP-Windows Adapter V9" | Set-NetIPInterface -InterfaceMetric 1

cd c:/
New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR
New-ItemProperty -Path 'HKCR:\Microsoft.PowerShellScript.1\Shell\Open\Command' -Name '(Default)' -PropertyType 'String' -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe'
Stop-Process -Name powershell -force