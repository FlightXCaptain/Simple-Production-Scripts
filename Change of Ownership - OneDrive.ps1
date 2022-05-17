#ONEDRIVE SECTION - Changing Owner of terminated users onedrive to their manager

#Install-Module PNP.Powershell
#Install-Module -Name Microsoft.Online.SharePoint.PowerShell
#Also Uses Active Directory Module. See https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps

$Url = #Sharepoint Admin url Eg. "https://example.sharepoint.com"

Connect-PNPOnline -Url $Url #Then login on popup with admin credentials for sharepoint.
Connect-SPOService -Url $Url #Then login on popup with admin credentials for sharepoint.

$Manager= #'Manager Username Eg. Example.Test'
$OneDriveUser= #'Users Onedrive Username Eg. Example.Test'

$UserUPN= Get-ADUser $OneDriveUser |Select -ExpandProperty UserPrincipalName

$NewUserUPN= Get-ADUser $Manager |Select -ExpandProperty UserPrincipalName

$OnedriveUrl = Get-PnPUserProfileProperty -Account $UserUPN | select PersonalUrl


$Site = Get-SPOSite -Identity $OnedriveUrl.PersonalUrl.TrimEnd('/')
Set-SPOUser -Site $Site.Url -LoginName $NewUserUPN -IsSiteCollectionAdmin $true