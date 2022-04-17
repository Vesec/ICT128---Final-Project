function Add-ADGroup {
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
    
      foreach ($Group in $GroupsFile) {
    
    
        $GroupOUName = $Group.Path
        $GroupDesc = $Group.Description
        $GroupPathObject = Get-ADOrganizationalUnit -Filter 'Name -like $GroupOUName'
        $GroupPath = $GroupPathObject.DistinguishedName
    
        New-ADGroup `
           -Name $GroupOUName `
           -SamAccountName $GroupOUName `
           -GroupCategory Security `
           -GroupScope Global `
           -DisplayName $GroupOUName `
           -Path $GroupPath `
           -Description $GroupDesc
    
    
        $GroupMembers = Get-ADUser -Filter * -SearchBase $GroupPathObject
    
    
    
        foreach ($Member in $GroupMembers) {
    
          $SamAccount = $Member.SamAccountName
          Add-ADGroupMember -Identity $GroupOUName -Members $SamAccount
    
    
        }
    
      }
    }