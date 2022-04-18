

function Get-CurrentTime{
<#
.DESCRIPTION
Retrieves and displays the current time.

#>

$Time = Get-WmiObject -Class Win32_LocalTime -ComputerName $env:COMPUTERNAME

$Hours = $Time.Hour
$Minutes = $Time.Minute
$Seconds = $Time.Second

Write-Host "The Current Time is $Hours : $Minutes : $Seconds"
}

Get-CurrentTime