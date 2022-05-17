#For Intunes Deployment
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
Remove-Item 'C:\Users\Public\Desktop\Google Chrome.lnk' -Force
Remove-Item 'C:\Users\Public\Desktop\VLC media player.lnk' -Force
Remove-Item 'C:\Users\Public\Desktop\Firefox.lnk' -Force
Remove-Item 'C:\Users\Public\Desktop\Acrobat Reader DC.lnk' -Force
Set-ExecutionPolicy Restricted -Force