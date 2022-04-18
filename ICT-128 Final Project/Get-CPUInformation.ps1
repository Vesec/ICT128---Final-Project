function Get-CPUInformation{
<#

.DESCRIPTION
Retrieves Information on the current CPU being used by a host machine.

#>
    Get-WmiObject -Class Win32_Processor | ft Name, MaxClockSpeed, SocketDesignation
    
    
    }
    
    Get-CPUInformation