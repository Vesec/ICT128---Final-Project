function Add-GPOValues {
    <#
    .SYNOPSIS
    Sets a GPO Registry Value
    
    .DESCRIPTION
    Loads a list of CSV values containing the Policy Name, Value, Type, Key, and Target. Then adds the values to the Targetted GPO.

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