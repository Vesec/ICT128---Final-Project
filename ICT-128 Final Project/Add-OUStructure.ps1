function Add-OUStructure {

    <#
    .SYNOPSIS
    Author: Tyler Dorner
    
    Creates the desired OU Structure from an Imported CSV File, supports one layer nesting.
    
    .DESCRIPTION
    Loads a Specified CSV file for a reference, then finds the Current Path for the in place Domain Controller and uses it to place new users in the specified Organizational Units. Sub OU's will be detected and added from a second column and the full OU structure will be displayed to the console.
    
    .NOTES
    Make sure the CSV file is correctly Formatted for the OU Structure before importing ---> The Headers Must be "Name,Sub,Top,Nest" | This is a function that will reside in the full script and the global paths will be re-used.
    #>
    
    
      foreach ($OU in $OUFile) {
    
        ##Creates Single Layer Nesting
    
        if ($OU.Name -ne "") {
    
    
          $TopOUObject = Get-ADOrganizationalUnit -Filter 'Name -like $TopOU'
          $TopOUPath = $TopOUObject.DistinguishedName
    
    
          New-ADOrganizationalUnit -Name $OU.Name -Path "$TopOUPath" -ProtectedFromAccidentalDeletion $False
    
        if ($OU.Sub -ne "") {
    
            $Sub = $OU.Sub.split(",")
    
            foreach ($OUSub in $Sub) {
    
              $TopSubOU = $OU.Name
              $SubOUObject = Get-ADOrganizationalUnit -Filter 'Name -like $TopSubOU'
              $SubOUPath = $SubOUObject.DistinguishedName
              New-ADOrganizationalUnit -Name $OUSub -Path "$SubOUPath" -ProtectedFromAccidentalDeletion $False
    
            }
    
    
    
    
          }
        }
    }