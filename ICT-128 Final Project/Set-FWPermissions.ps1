function Set-FWPermissions{
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
    
    try{
      New-NetFirewallRule -DisplayName "Allow IPv4 Ping Inbound" -Name "Allow IPv4 Ping Inbound" -direction Inbound -IcmpType 8 -Protocol ICMPv4 -Action Allow
      New-NetFirewallRule -DisplayName "Allow IPv4 Ping Outbound" -Name "Allow IPv4 Ping Outbound" -direction Outbound -IcmpType 8 -Protocol ICMPv4 -Action Allow
    }
  
    catch{ Write-Warning "Firewall Rule Already Exists"}
  }