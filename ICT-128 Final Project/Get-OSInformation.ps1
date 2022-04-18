function Get-OSInformation{
<#

.DESCRIPTION
Lists the information about the current computers OS version and service pack.

#>
Get-WmiObject -Class Win32_OperatingSystem
    
}
    
Get-OSInformation