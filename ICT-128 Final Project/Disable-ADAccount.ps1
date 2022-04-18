
function Disable-ADAccount{
    <#
    .SYNOPSIS
    Search for and Disable AD Users
    
    .DESCRIPTION
    Queries the user to filter through User Accounts, Propmts to disable account after search has isolated one user, Disables Account. 
    
    #>

$UserCount = 0

while ($UserCount -ne 1){

try{
    $Query = Read-Host "Enter an Account Name To Disable, use '*' to filter"
    $UserMatch = Get-ADUser -Filter 'Name -like $Query'
    $UserMatch | ft Name, Enabled
    $UserCount = ($UserMatch).count
    

    if ($UserCount -eq 0){
        Write-Warning "No Results Found, Try Again."
    }
}
    
    
    catch{Write-Warning "No Results Found, Try Again."}
}
  

$UserName = $UserMatch.Name
$Confirmation = Read-host "Are you Sure you want to Disable $UserName ? (y/n)"

if ($Confirmation -eq "y" -or $Confirmation -eq "Y"){
    $UserDN = (Get-ADUser -Filter 'Name -like $Query').DistinguishedName
    Get-ADUser -Filter 'Name -like "*"' -SearchBase "$UserDN" | Disable-ADAccount 

}

else{
    Write-Warning "No Actions Taken"
}
}

Disable-ADAccount