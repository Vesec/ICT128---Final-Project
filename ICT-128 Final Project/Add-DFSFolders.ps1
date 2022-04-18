function Add-DFSFolders{
  <#
  .SYNOPSIS
  Creates a DFS replication group for each of the given drives in a specified array.
  
  .DESCRIPTION
  Creates DFS folders for a given array of drives, assigns specified server memberships, Staging Quotas, and share names for each drive.
  
  .NOTES
  The five drives in the array can be swapped with a CSV file to assign the drive names and letters.
  #>
  
    $DriveArray = "Finance", "Internal", "IT Resources", "Marketing", "HR"
    
        foreach($Drive in $DriveArray){
  
            New-DfsReplicationGroup -GroupName "$Drive Volume" | `
            New-DfsReplicatedFolder -FolderName "$Drive" | `
            Add-DfsrMember -ComputerName "DC01-Kelowna","DC02-Kelowna" | `
            Format-Table dnsname,groupname -auto -wrap
        
            if ($Drive -eq "Finance"){
                $Letter = 'F:\'
                }
            elseif ($Drive -eq "Internal"){
                $Letter = 'I:\'
                }
            elseif ($Drive -eq "IT Resources"){
                $Letter = 'Z:\'
                }
            elseif ($Drive -eq "Marketing"){
                $Letter = 'M:\'
                }
            elseif ($Drive -eq "HR"){
                $Letter = 'H:\'
                }
            
        Add-DfsrConnection -GroupName "$Drive Volume" -SourceComputerName "DC01-Kelowna" `
        -DestinationComputerName "DC02-Kelowna" | Format-Table *name -wrap -auto
        
        Set-DfsrMembership -GroupName "$Drive Volume" -FolderName "$Drive" -ContentPath "$Letter" `
        -ComputerName "DC01-Kelowna" -PrimaryMember $True -StagingPathQuotaInMB 16384 -Force | `
        Format-Table *name,*path,primary* -auto -wrap
        
        Set-DfsrMembership -GroupName "$Drive Volume" -FolderName "$Drive" -ContentPath "$Letter" `
        -ComputerName "DC02-Kelowna","DC03-Calgary","DC04-Calgary" -StagingPathQuotaInMB 16384 -Force | `
        Format-Table *name,*path,primary* -autosize -wrap
        
        New-DfsnFolder `
        -Path "\\Raudz\ShareAccess\$Drive" `
        -TargetPath "\\DC01-KELOWNA\$Drive" `
        -EnableTargetFailback $True
    
    }
  }