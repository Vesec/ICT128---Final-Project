function Get-BIOSInformation{
<#

.DESCRIPTION
Retrieves Information about the computers BIOS Including Version, Name , Serial and Manufacturer.

#>
Get-WmiObject -Class Win32_BIOS | ft Manufacturer, Name, Version, Serialnumber
    
}
    
Get-BIOSInformation