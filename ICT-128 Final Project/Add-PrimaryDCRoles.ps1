function Add-PrimaryDCRoles {
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
    
    Install-windowsfeature -Name AD-Domain-Services -IncludeManagementTool
    Install-windowsfeature -Name DHCP -IncludeManagementTool
    Install-WindowsFeature -Name FS-DFS-Namespace,FS-DFS-Replication,FS-SMB1 -IncludeManagementTools
    Install-ADDSForest -DomainName "$Forest" -InstallDNS -Force -DomainNetBiosName "Raudz"
  
  }