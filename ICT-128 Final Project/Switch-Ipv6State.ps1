function Switch-IpV6State{
    
    <#
    .SYNOPSIS
    Detects the State of IPV6 Networking and Disable Or Enables it.
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
  
  
  $IPv6Check = Get-NetAdapterBinding | Where-Object ComponentID -EQ 'ms_tcpip6'
  $IPv6Status = $IPv6Check.enabled
  
  
  if ($IPv6Status -eq $True){
    Disable-NetAdapterBinding -Name 'Ethernet' -ComponentID 'ms_tcpip6'
    }

  elseif ($IPv6Status -eq $False){
    Disable-NetAdapterBinding -Name 'Ethernet' -ComponentID 'ms_tcpip6'
    }

  
  }