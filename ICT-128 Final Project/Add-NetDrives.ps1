function Add-NetDrives{
    <#
    .SYNOPSIS
    Uses the DriveMap.Csv To Create the Specified Network Drives. 
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    
      if ($NetDrives -eq "Y"){
      
        foreach ($Drive in $Drivemap){
            
            $NetworkDrive = "$VMPath" + $Drive.Name + $Vmname + ".Vhdx"
            New-VHD -Path "$NetworkDrive" -Dynamic -SizeBytes $VMHDDSize
            Get-VM "$VMName" | Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -Path $NetworkDrive
    
            }
    }
    
    }