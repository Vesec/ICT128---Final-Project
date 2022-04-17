function Add-GPOStructure {

    <#
    .SYNOPSIS
    Creates a GPO in the Assigned OU with Values From GPOSettings.Csv
    
    .DESCRIPTION
    
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    
    
      foreach ($GPO in $GPOStructure) {
    
        $GPOName = $GPO.Name
        $GPOLinks = $GPO.Link.split(",")
    
    
        new-gpo -Name "$GPOName"
    
        foreach ($Link in $GPOLinks) {
    
          $GPOPathObject = Get-ADOrganizationalUnit -Filter 'Name -like $Link'
          $GPOPath = $GPOPathObject.DistinguishedName
          new-gplink -Name "$GPOName" -target "$GPOPath"
    
        }
      }
    }