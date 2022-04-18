function Switch-PSRemoting{
<#
.SYNOPSIS
Changes the state of PS remoting.

.DESCRIPTION
Detects the current state of the Remoting and switches from enabled or disabled based on the current detected state.

#>

$State = (Get-PSSessionConfiguration).enabled

if ($State -eq $true){
    Disable-PSRemoting -force
}

else{
    Enable-PSRemoting -Force
}

Get-PSSessionConfiguration | Format-Table -Property Name, Permission -Auto
}

Switch-PSRemoting