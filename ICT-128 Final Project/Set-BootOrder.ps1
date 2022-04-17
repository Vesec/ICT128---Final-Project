function Set-BootOrder{
    <#
    .SYNOPSIS
    Sets the boot order for ISO attached VM's.
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    
    $VMObject = Get-VMFirmware $VMname -ErrorAction SilentlyContinue
    $VMBootOrder = $VMObject.BootOrder
    
    $Network = $VMBootOrder[0]
    $DVD = $VMBootOrder[1]
    $VHD = $VMBootOrder[2]
    
    Set-VMFirmware -VMName $VMname -BootOrder $DVD,$VHD,$Network
    
    }