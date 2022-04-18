
function Get-AttachedDrives{
    <#
    .SYNOPSIS
    Retrieves a list of disks attached to the current system.
    
    .DESCRIPTION
    Uses Gwmi to retrive a list of disks, iterates through the list to format the drive sizes into GB, and determine the type of disk.

    #>

    $Disks = Gwmi Win32_LogicalDisk
    
    foreach ($Drive in $Disks){
        
        if ($Drive.Drivetype -eq 2){
            $DriveType = "Removable disk"
        }

        if ($Drive.Drivetype -eq "3"){
            $DriveType = "Fixed local disk"
        }

        if ($Drive.Drivetype -eq 4){
            $DriveType = "Network disk"
        }

        if ($Drive.Drivetype -eq 5){
            $DriveType = "Compact disk"
        }
    
    
    $Drive | Select DeviceID, VolumeName, `
    @{Name='DriveType';Expression={$Drivetype}}, `
    @{Name='DriveSize(GB)';Expression={[Math]::Ceiling($_.Size/1GB)}}, `
    @{Name='FreeSpace(GB)';Expression={[Math]::Ceiling($_.FreeSpace/1GB)}} | ft
    }
}
    Get-AttachedDrives