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
function Add-DFSRoot{

    New-Item -Path "C:\DFSRoots\Shares" -ItemType Directory  -Force | Out-Null
    New-SmbShare -Name ShareAccess -path 'C:\DFSRoots\Shares' -ChangeAccess "Domain Users" -FullAccess "Domain Admins"
    New-DfsnRoot -TargetPath "\\DC01-KELOWNA\ShareAccess" -Type DomainV2 -Path "\\Int.Raudz.Com\ShareAccess" -GrantAdminAccounts "GrantAdmin" -EnableRootScalability $True
    
    }