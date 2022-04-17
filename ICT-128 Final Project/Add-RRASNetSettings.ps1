function Add-RRASNetSettings{
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>

    $AutoIndex = Get-NetAdapter -Name * -Physical
    [int] $LANIntIndex = $AutoIndex.InterfaceIndex[0]
    [int] $WANIntIndex = $AutoIndex.InterfaceIndex[1]
    $LANName = $AutoIndex.Name[0]
    $WANNAme = $AutoIndex.Name[1]
    
    
    foreach($Line in $NetworkConfig){
    
        $RRASIP = $Line.IPAddress
        $RRASMask = $Line.Mask
        $RRASGatewayIP = $Line.Gateway
    
        if($Line.NIC -eq "LAN" -and $Line.Hostname -eq $env:COMPUTERNAME){
    
            New-NetIPAddress -InterfaceIndex $LANIntIndex -IPAddress $RRASIP -Prefixlength $RRASMask `
            -AddressFamily IPv4
    
            Rename-NetAdapter -Name $LANName -NewName "LAN"
            
        }
    
        if($Line.NIC -eq "WAN" -and $Line.Hostname -eq $env:COMPUTERNAME){
    
            New-NetIPAddress -InterfaceIndex $WANIntIndex -IPAddress $RRASIP -Prefixlength $RRASMask `
            -DefaultGateway "$RRASGatewayIP" -AddressFamily IPv4
    
            Rename-NetAdapter -Name $WANName -NewName "WAN"
            
        }
    }
    
    }