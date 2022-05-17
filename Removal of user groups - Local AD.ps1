#This uses the ActiveDirectory Powershell Module which is available for import using Import-module ActiveDirectory After the RSAT server administration tools has been added to your machine. See https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps

$Users= Get-ADUser -Filter '*' -SearchBase '' #Eg. 'OU=Terminated Users,OU=Users,DC=Example,DC=Example'

ForEach ($user in $Users)
{

$groups= (Get-ADUser $user.SamAccountName -properties MemberOf | Select-Object).MemberOf

    ForEach ($group in $groups)
    {
  
    Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false 
    }
    $Month = Get-Date -format MM
    $Day = Get-Date -format dd
    $Year = Get-Date -format yyyy

    set-aduser -identity $user -description "Disabled $Day/$Month/$Year"
    set-aduser -identity $user -company $null 
    set-aduser -identity $user -manager $null 
    set-aduser -identity $user -department $null 
    set-aduser -identity $user -title $null 
    set-aduser -identity $user -office $null 
    set-aduser -identity $user -OfficePhone $null 
    set-aduser -identity $user -HomePage $null 

    Get-ADUser $user  | Move-ADObject –TargetPath '' #Location to move deleted accounts if needed. same format as above.
}
