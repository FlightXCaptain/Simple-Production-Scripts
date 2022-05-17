#Knowbe4 Second Chance Addon Distribution from Intunes

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Start-Job -Name 'temp' -ScriptBlock {
    $testpath = Test-Path C:\temp 
    if ($testpath -eq $false) {
        New-Item -Path 'C:\temp' -ItemType Directory
    }else {
        Write-Output "File Already Exists"
    } 
} | Wait-Job

$Detect_SecondChance = Test-Path 'C:\Program Files (x86)\KnowBe4\Second Chance\knowbe4.secondchance.service.exe'
    if ($Detect_SecondChance -eq $false){
        Start-Job -Name "DownloadingSecondChance" -ScriptBlock {
            Invoke-WebRequest -Uri 'https://storagelocation/SecondChanceSetup.exe' -OutFile 'C:\temp\SecondChance.exe' 
        } | Wait-Job
        
        Start-Job -Name 'InstallingSecondChance' -Scriptblock {      
            Start-Process 'C:\temp\SecondChance.exe' -ArgumentList  '/q', '/ComponentArgs "KnowBe4 Second Chance":"LICENSEKEY=""#LicenceKey#"""' -wait
            } | Wait-Job 
    } 
    else {
        Write-Output "Second Chance Already Exists"
    }

Remove-Item 'C:\temp' -Recurse -Force