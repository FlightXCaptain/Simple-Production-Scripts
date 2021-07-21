#Creates a new Distribution list and Migrates all users to it from an existing one. Useful when migrating to Exchange Online
param (
    [Parameter (Mandatory= $true)]
    [string]$NewDGName,
    [String]$OldDGEmail,
    [Parameter (Mandatory= $true)]
    [string]$NewDGEmail,
    [Parameter (Mandatory= $true)]
    [string]$DGManagers
)

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'
Connect-ExchangeOnline -Credential $AzureCredential

New-DistributionGroup -Name $NewDGName -Type Distribution -MemberJoinRestriction ApprovalRequired -ManagedBy $DGManagers -PrimarySmtpAddress $DGEmail -DisplayName $NewDGName

Start-Sleep -Seconds 120

$Users = Get-DistributionGroupMember -Identity $OldDGEmail

ForEach ($User in $Users) {
    Add-DistributionGroupMember -Identity $DGEmail -member $User.PrimarySmtpAddress
}
Disconnect-ExchangeOnline -Confirm:$false