 Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

#For Intunes Deployment
#this script needs to be run as admin.
#this script assumes teams is installed with default settings and location.
#Suggest using Azure Storage Blob for images.

#this section checks/creates the directory for the teams backgrounds
Start-Job -Name "Checking for folder" -ScriptBlock {
    $path = "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Backgrounds\Uploads"
    $path0 = Test-Path $path
    if ($path0 -eq $false){
        New-Item -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Backgrounds\Uploads" -ItemType Directory -ErrorAction SilentlyContinue
        Write-Output "Folder Created"
    }else {
        Write-Output "Folder Already Exists"
    } 
} | Wait-Job |  Receive-Job

#this section will check for if the files are already there or not and if not it will add them.
#Duplicate Following Section for multiple images.

Start-Job -Name "Checking for Image" -ScriptBlock {
    $path1 = "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Backgrounds\Uploads\TeamsBackground.jpg"
    $path2 = Test-Path $path1 
    if ($path2 -eq $false){
        Start-Job -Name "Downloading Image" -ScriptBlock { 
        Invoke-WebRequest -Uri "Imagelink.jpg" -OutFile "$env:USERPROFILE\AppData\Roaming\Microsoft\Teams\Backgrounds\Uploads\TeamsBackground.jpg"
        } | Wait-Job
        Write-Output "Image Downloaded"
    }else {
        Write-Output "Image Already Exists"
    }
} | Wait-Job | Receive-Job
