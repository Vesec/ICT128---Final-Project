function Get-SiteHabits{
    $Contents = "Security,Website"
    cd ~\appdata\Roaming\Mozilla\
    $path = Get-ChildItem *storage -Recurse
    cd $path\Default
    ls *Http* | Format-Table Name | Outfile "Site-Habits.CSV"

function sort-csv{
    Import-csv "Site-Habits.CSV"
    foreach ($Site in $list){
        $Security, $Website = $Site.Name.split("+++")
        $Global:Contents = $Global:Contents + "`n$Security,$Website"
    }
    $Global:Contents | Out-File "Site-Habits.CSV"
    }
}