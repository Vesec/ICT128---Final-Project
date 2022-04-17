function Set-PasswordPolicy {
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

    Get-ADDefaultDomainPasswordPolicy -Current LoggedOnUser | `
       Set-ADDefaultDomainPasswordPolicy `
       -ComplexityEnabled $true `
       -MinPasswordLength 10 `
       -MaxPasswordAge "60.00:00:00" `
       -PasswordHistoryCount 3 `
       -LockoutDuration "0.00:00:05" `
       -LockoutObservationWindow "0.00:00:05" `
       -LockoutThreshold 3
  
  }