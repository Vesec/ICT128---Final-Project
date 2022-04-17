function Get-AutomationFunctions{
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

    if ($Userchoice -eq "1"){
        $Basefile | ft Index, Hostname, IPv4, Roles, Server
  
        try{
  
        $DeviceSelection = Read-Host "Enter the Index of the Device to Load the Settings"
        $DeviceSelection -= 1
  
        $Global:HostIP = $Basefile.IPV4[$DeviceSelection]
        $Global:Hostname = $Basefile.Hostname[$DeviceSelection]
        $GLobal:Subnet = $Basefile.Subnet[$DeviceSelection]
        $Global:GatewayIP = $Basefile.Gateway[$DeviceSelection]
        $Global:Mask = $Basefile.Mask[$DeviceSelection]
        $Global:DHCPStart = $Basefile.DHCPStart[$DeviceSelection]
        $Global:DHCPEnd = $Basefile.DHCPEnd[$DeviceSelection]
        $Global:VPNStart = $Basefile.VPNStart[$DeviceSelection]
        $Global:VPNEnd = $Basefile.VPNEnd[$DeviceSelection]
        $Global:Roles = $Basefile.Roles[$DeviceSelection]
        $Global:ServerRole = $Basefile.Server[$DeviceSelection]
        $Global:NetworkID = $Basefile.NetworkID[$DeviceSelection]
  
        }
  
        catch{
  
            Write-Warning "Oh darn, Something Went Wrong With the Configuration"
        }
        
        finally{
  
            Get-DeploymentMenu
        }
        
    }
  
    elseif ($Userchoice -eq "2"){
  
      if ($Serverrole -eq "RRAS"){
        Add-RRASNetSettings
      }
  
      if ($Serverrole -ne "RRAS"){
        Add-NetworkSettings
      }
  
        Set-Hostname
        Disable-IPv6
        Restart-Computer
        Get-DeploymentMenu
     }
  
    elseif ($Userchoice -eq "3") {
  
         if ($Serverrole -eq "Primary"){
  
            Add-PrimaryDCRoles
            Set-FWPermissions
            Get-DeploymentMenu
        }
  
        elseif ($Serverrole -eq "Secondary"){
  
            Add-SecondaryDCRoles
            Set-FWPermissions
            Write-Warning "You Are About To attach To a Primary Domain Controller, Ensure you can NSLookup the Primary before attaching"
            $NetBios = Read-Host "Enter the NETBIOS"
            Install-ADDSDomainController -Domainname "$Forest" -Credential (Get-Credential "$NetBios\Administrator")
            Get-DeploymentMenu
        }
  
        elseif ($Serverrole -eq "RAS"){
          Install-WindowsFeature "RemoteAccess","Routing","DirectAccess-VPN","RSAT-RemoteAccess" -IncludeManagementTools
  
  
          Get-DeploymentMenu
        }
    }
  
    elseif ($Userchoice -eq "4") {
  
      Set-OUPath
      Add-TopOU
      Add-OUStructure
      Add-GPOStructure
      Add-GPOValues
      Add-OUUsers
      Add-ADGroup
      $Drivesetup = Read-Host "Setup and Map Network Drives Attached to the Server? (y/n)"
  
      if ($Drivesetup -eq "y" -or $Drivesetup -eq "Y"){
        Add-DriveProperties
        Add-NetDrivesPath
      }
  
      Set-PasswordPolicy
      Set-ComputerPath
      Import-GPOBackup
      Add-NetworkFiles
      Write-Warning "All Users, OU's and GPO's have been Created Successfully"
      Get-DeploymentMenu
  
  }
  
    elseif ($Userchoice -eq "5") {
        Set-HostDNSRecords
        Set-PrimaryDHCPRole
        Get-DeploymentMenu
      }
  
      elseif ($Userchoice -eq "6") {
        Set-HostDNSRecords
        Set-PrimaryDHCPRole
        Get-DeploymentMenu
      }
      
      
    elseif ($Userchoice -eq "7") {
        Set-HostDNSSecondary
        Get-DeploymentMenu
      }
  
    elseif ($Userchoice -eq "8"){
        Add-DHCPFailover
        Get-DeploymentMenu
    }
  
    elseif ($Userchoice -eq "9"){
        Add-DFSRoot
        Add-DFSFolders
        Get-DeploymentMenu
    }
  
    elseif ($Userchoice -eq "10"){
        Add-PTRRecords
        Get-DeploymentMenu
    }
  
    elseif ($Userchoice -eq "11"){
      $RRASLocation = Read-Host "BE CAREFUL, Is this Kelowna or Calgary? (K/C)"
  
      if($RRASLocation -eq "k" -or $RRASLocation -eq "K"){
        Add-KelownaRRASConnection
      }
    
      elseif($RRASLocation -eq "c" -or $RRASLocation -eq "C"){
        Add-CalgaryRRASConnection
      }
      Get-DeploymentMenu
  }
  
  
    elseif ($Userchoice -eq "Back" -or $Userchoice -eq "back"){
            Get-TitleScreen
  
        }
  
  }