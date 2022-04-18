function Get-ForestInfo{
    <#
    .SYNOPSIS
    Retrieves information about the AD Environment
    
    .DESCRIPTION
    Lists the name of the Forest, Schema Location, and all sites associated with an AD Environment.
    
    #>
    
    
    Get-ADForest | ft Name,SchemaMaster,Sites
    
    
    }
    
    Get-ForestInfo