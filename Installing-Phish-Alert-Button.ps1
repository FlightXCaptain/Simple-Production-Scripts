#Knowbe4 Phish Alert button install from Intunes

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Start-Job -Name 'temp' -ScriptBlock {
    $testpath = Test-Path C:\temp 
    if ($testpath -eq $false) {
        New-Item -Path 'C:\temp' -ItemType Directory
    }else {
        Write-Output "File Already Exists"
    } 
} | Wait-Job

$Detect_PhishAlert = Test-Path 'C:\Program Files (x86)\KnowBe4\Phish Alert\adxregistrator.exe'
    if ($Detect_PhishAlert -eq $false){
        Start-Job -Name "DownloadingPhishAlert" -ScriptBlock {
            Invoke-WebRequest -Uri 'https://storage/PhishAlert.msi' -OutFile 'C:\temp\PhishAlert.msi' 
        } | Wait-Job
        
        Start-Job -Name 'InstallingPhishAlert' -Scriptblock {      
            Start-Process "msiexec.exe" -ArgumentList "/quiet", "/i C:\temp\PhishAlert.msi LicenseKey=#LicenceKey# ALLUSERS=1" -wait
            } | Wait-Job 
    } 
    else {
        Write-Output "Phish Alert Button Already Exists"
    }

Remove-Item 'C:\temp' -Recurse -Force