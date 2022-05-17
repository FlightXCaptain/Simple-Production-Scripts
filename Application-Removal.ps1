#For Uninstalling Programs that intunes cannot uninstall.
#Use Get-WmiObject to get the exact application name
#For Intunes Deployment

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

Get-WmiObject -Class Win32_Product | Select-Object -Property Name

$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Application Name"}

$MyApp.Uninstall()
