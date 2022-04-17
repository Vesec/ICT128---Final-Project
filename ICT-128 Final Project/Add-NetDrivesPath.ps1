function Add-NetDrivesPath{
    <#
    .SYNOPSIS
      Creates a Drive Share for CSV Specified User Groups, and Employs Exclusions.
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
  
      foreach ($Drive in $Drivemap){
  
          $Letter = $Drive.Letter
          $DriveName = $Drive.Name
  
          $Groups = ($Drive.Groups).Split(",")
          $GroupArray = @();$GroupArray += $Groups
          
          $Exclusions = ($Drive.Exclude).split(",")
          $ExclusionArray = @();$ExclusionArray += $Exclusions
          
          if ($Drive.Exclude -eq ""){
          New-smbshare -Name "$DriveName" -Path "${Letter}:\" -ChangeAccess $GroupArray
          }
          elseif ($Drive.Exclude -ne ""){
          New-smbshare -Name "$DriveName" -Path "${Letter}:\" -ChangeAccess $GroupArray -NoAccess $ExclusionArray
          }
          
      
      }
    }