function Get-DClist{
<#
.SYNOPSIS
Retrieves a list of all the domain controllers in a forest.

.DESCRIPTION
Finds all the domain controllers in a forest and populates a table containing the Name, IP Address, OS Version, OS Type, and The Domain.

#>



(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_}| `
Ft -Property Name,IPv4Address,Domain,
@{N='OS';E={$_.OperatingSystem}}, `
@{N='OSVersion';E={$_.OperatingSystemVersion}}

}

Get-DClist

