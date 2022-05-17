#Uses Encrypted Variables to Get and then encrypt MSAccess Token for Use with other api Azure automation scripts. Suggested to set on 3hr schedule

$ClientID = Get-AutomationVariable -Name 'ClientID'
$ClientSecret = Get-AutomationVariable -Name 'Client Secret'
$TenantID = Get-AutomationVariable -Name 'TenantID'

#Invoke-RestMethod -Uri https://login.microsoftonline.com/$TenantID/oauth2/token -Method Post

$connectionDetails = @{
    'TenantId'     = $TenantID
    'ClientId'     = $ClientID
    'ClientSecret' = $ClientSecret | ConvertTo-SecureString -AsPlainText -Force
}

$AccessToken1 = Get-MsalToken @connectionDetails | Select AccessToken   
$AccessToken = $AccessToken1.AccessToken
Set-AutomationVariable -Name 'MsAccessToken' -Value $AccessToken |ConvertTo-SecureString -AsPlainText -Force
#Write-Output $AccessToken