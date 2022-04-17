function Add-VPNS2SConnection{
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Hostname
    Parameter description
    
    .PARAMETER VPNType
    Parameter description
    
    .PARAMETER VPNStart
    Parameter description
    
    .PARAMETER VPNEnd
    Parameter description
    
    .PARAMETER RemoteHost
    Parameter description
    
    .PARAMETER DestinationIP
    Parameter description
    
    .PARAMETER Protocol
    Parameter description
    
    .PARAMETER DestinationSubnet
    191.168.1.0/24:1
    
    .PARAMETER SharedSecret
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>

    [CmdletBinding]

    param(
        [parameter(Mandatory=$True)]
        $Hostname,
        [parameter(Mandatory=$True)]
        $VPNType,
        [parameter(Mandatory=$True)]
        $VPNStart,
        [parameter(Mandatory=$True)]
        $VPNEnd,
        [parameter(Mandatory=$True)]
        $RemoteHost,
        [parameter(Mandatory=$True)]
        $DestinationIP,
        [parameter(Mandatory=$True)]
        $Protocol,
        [parameter(Mandatory=$True)]
        $DestinationSubnet,
        [parameter(Mandatory=$True)]
        $SharedSecret

    )

    install-Remoteaccess -Computername $Hostname -vpntype VPNS2S -IPAddressRange "$VPNStart","$VPNEnd" -Legacy
    Add-VPnS2SInterface -Name $RemoteHost -Protocol IKEv2 -Destination $DestinationIP -AuthenticationMethod PSKonly -IPV4Subnet $DestinationSubnet -SharedSecret $SharedSecret
    Set-VpnServerIPsecConfiguration -CustomPolicy -EncryptionMethod AES256 -AuthenticationTransformConstants SHA196 -CipherTransformConstants AES256 -IntegrityCheckMethod SHA1
    
    }