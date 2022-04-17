function Set-HostDNSSecondary{
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
  
    $Stall = Read-Host "Press [Enter] When You are Ready For The DNS Zone Transfer"
    Add-DnsServerSecondaryZone -MasterServers "$HostIP" -Name "$Forest" -ZoneFile "$Forest"
    Add-DnsServerSecondaryZone -MasterServers "$HostIP" -Name $DNSReverse -ZoneFile $DNSReverse ##Needs the Variable supplied from CSV
    Get-DnsServerZone
  }