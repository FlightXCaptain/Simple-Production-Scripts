#Using Power automate to set this script up to run from a button on my phone after sending out updates to speed up the process.

$AzureCredential = Get-AutomationPSCredential -Name 'Powershell'

Connect-MSGraph -Credential $AzureCredential

$DeviceID = Get-IntuneManagedDevice -Filter "Contains(operatingsystem, 'Windows')" | Select managedDeviceID

ForEach ($Device in $DeviceID){
    Invoke-IntuneManagedDeviceSyncDevice -managedDeviceId $Device.managedDeviceID
    Write-Host "Sending Sync request to Device with DeviceID $($DeviceID.managedDeviceID)" -ForegroundColor Yellow
}