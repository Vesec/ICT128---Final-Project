


(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }| `
Format-Table -Property Name,ComputerObjectDN,Domain,Forest,IPv4Address,OperatingSystem,OperatingSystemVersion