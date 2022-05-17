param (
    [string]$NewGroup,
    [String]$Group
)

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-AzureAD -Credential $AzureCredential

$ObjectID1 = Get-AzureADGroup -SearchString $Group | Select -First 1
$ObjectID = $ObjectID1.ObjectId

$ObjectID2 = Get-AzureADGroup -SearchString $NewGroup | Select -First 1
$ObjectID3 = $ObjectID2.ObjectId

$GroupMembers1 = Get-AzureADGroupMember -ObjectId $ObjectID -Top 500
$GroupMembers = $GroupMembers1.ObjectID

ForEach ($User in $GroupMembers)
{
    Add-AzureADGroupMember -ObjectId $ObjectID3 -RefObjectID $User
}
