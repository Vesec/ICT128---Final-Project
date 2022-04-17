function Add-DHCPFailover{
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

    Add-DhcpServerInDC -DnsName "$Forest" -IPAddress $SecondaryIP
    
    
    Add-DhcpServerv4Failover `
    -ComputerName "$SecHostname.$Forest" `
    -Name "$TopOU Network" `
    -PartnerServer "$Hostname.$Forest" `
    -ScopeId $ScopeID `
    -LoadBalancePercent 50 `
    -MaxClientLeadTime 2:00:00 `
    -AutoStateTransition $True `
    -StateSwitchInterval 2:00:00
    
    }