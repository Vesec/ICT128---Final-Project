
function Set-ADPassword{
<#
.SYNOPSIS
Resets an Active Directory Account Password

.DESCRIPTION
Takes in User input for an Account Identifier using the SAM, Sid, GUID or Distinguished Name and then asks for a password to be entered. 
Optionally you can set an account to have it's password reset at logon.

#>

$UserAccount = Read-host "Enter an Account Identifier"
$ResetAction = Read-Host "Allow user to reset password at logon? (y/n)"

if ($ResetAction -eq "y" -or $ResetAction -eq "Y"){
    Set-ADUser -Identity $UserAccount -ChangePasswordAtLogon $true
}

else{
    $UserPassword = Read-host "Enter a New Password" -AsSecureString
    $Credential = Get-Credential

    Set-ADAccountPassword `
    -Identity $UserAccount `
    -NewPassword $UserPassword `
    -Credential $Credential
    }
}

Set-ADPassword