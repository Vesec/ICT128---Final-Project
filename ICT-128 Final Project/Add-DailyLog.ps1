
function Add-DailyLog{
<#
.SYNOPSIS
Adds a File with the Name as the current date in a Logfile Folder

.DESCRIPTION
Retrieves the Current date, Checks if a "Logfiles" folder and current date file exists and creates both if neither exists.

#>

$FileName = (Get-Date).tostring("dd-MM-yyyy")
$FolderPath="C:\Logfiles"
$Path = $FolderPath+"\"+ $FileName+".txt"


if (!(Test-Path $FolderPath))
{
    New-Item -Path "c:\" -Name "Logfiles" -ItemType "directory"
}

if (!(Test-Path $Path))
{
    New-Item -itemType File -Path $FolderPath -Name ($FileName + ".txt")
}
else
{
    Write-Host "File already exists"
}
}

Add-DailyLog