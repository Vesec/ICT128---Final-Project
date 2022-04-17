function Import-GPOBackup{

    <#
    .SYNOPSIS
    Imports a Previously used GPO from a Specified path.
    
    .DESCRIPTION
    Imports a GPO from its ID and the detected path that the Backups are stored. 
    The Target Name will match a pre-existing gpo to change its inherent properties.
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
  
    
        foreach ($GPO in $GPOBackups){
          $GPOID = $GPO.ID
          $GPOTarget = $GPO.Target
          import-gpo `
          -BackupId "$GPOID" `
          -TargetName "$GPOTarget" `
          -path "$AuployPath\Settings\GPO\Backups" `
          -CreateIfNeeded
      }
    
        
    }