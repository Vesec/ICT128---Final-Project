function Add-OUUsers {

    <#
    .SYNOPSIS
    Imports Users From a CSV File and Adds Them Into A Specified OU Structure.
    
    .DESCRIPTION
    Searches for a matching OU that contains the users Subdepartment. Users will be created and referenced by their EmployeeID and must login with that as their username. 
    
    .NOTES
    General notes
    #>
    
    
      ## Iterate Through CSV
      foreach ($User in $Userfile) {
    
        ## Grab and Assign CSV Info
        $Username = $User. "First Name"[0] + "." + $User. "Last Name"
        $OU = $User.Subdepartment
        $Firstname = $User. "First Name"
        $Lastname = $User. "Last Name"
        $Display = "$Firstname" + " " + "$Lastname"
        $Site = $User.Site
        $Title = $User.Title
        $Department = $User.Department
        $EmployeeID = $User."Employee ID"
        $OUObject = Get-ADOrganizationalUnit -Filter 'Name -like $OU'
        $OUpath = $OUObject.DistinguishedName
    
        ## User Check
        if (Get-ADUser -F { SamAccountName -eq $EmployeeID }) {
          Write-Warning "A user account with username $Username already exist in Active Directory."
        }
    
        else {
    
          ## Add User
          New-ADUser -SamAccountName "$EmployeeID" `
             -UserPrincipalName "$Firstname.$Lastname@$TopOU.com" `
             -Name "$Display" `
             -GivenName "$Firstname" `
             -Surname "$Lastname" `
             -Enabled $True `
             -DisplayName "$Display" `
             -Path $OUpath `
             -Company "$Site" `
             -Title $Title `
             -Description $Title `
             -Department $Department `
             -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -ChangePasswordAtLogon $True
          Write-Host "$Username Created"
    
        }
    
    
      }
    
    
    }
    