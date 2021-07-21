#This will mark all enterprise apps as hidden in AzureAD so they dont show in Company Portal when migrating to Microsoft Endpoint Manager
$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-AzureAD -Credential $AzureCredential

$ObjectID1 = Get-AzureADServicePrincipal -All:$true |?{$_.Tags -eq "WindowsAzureActiveDirectoryIntegratedApp"}| Select-Object ObjectId
$ObjectID = $ObjectID1.ObjectId
ForEach ($Object in $ObjectID) {
$servicePrincipal = Get-AzureADServicePrincipal -ObjectId $Object
$tags = $servicePrincipal.tags
$tags += "HideApp"
Set-AzureADServicePrincipal -ObjectId $Object -Tags $tags
}
