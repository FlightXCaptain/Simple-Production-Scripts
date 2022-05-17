#For Creating temp folder for Application installs.

$testpath = Test-Path C:\temp 
if ($testpath -eq $false) {
    New-Item -Path 'C:\temp' -ItemType Directory
}else {
    Write-Host "File Already Exists"
}

#For later Removing the folder. Make sure to use job commands to ensure install has completed before removing the installer. Eg. Start-Job & Wait-Job

Remove-Item -Path 'C\temp' -ItemType Directory -Confirm:$false