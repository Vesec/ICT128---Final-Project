function Add-GPOValues {
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
    
    
    
      foreach ($Setting in $GPOSettings) {
    
        $GPOPolicy = $Setting.Policy
        $GPOValue = $Setting.Value
        $GPOType = $Setting.Type
        $GPOName = $Setting.Name
        $GPOKey = $Setting.Key
    
    
    
        if ($GPOType -eq "DWord") {
    
          [int]$DWord = $GPOValue
    
          Set-GPRegistryValue `
             -Name $GPOPolicy `
             -Key $GPOKey `
             -ValueName $GPOName `
             -Value $DWord `
             -Type $GPOType `
    
    
    
        }
    
        if ($GPOType -eq "String") {
    
    
          Set-GPRegistryValue `
             -Name $GPOPolicy `
             -Key $GPOKey `
             -ValueName $GPOName `
             -Value $GPOValue `
             -Type $GPOType `
    
        }
    
    
      }
    
    }