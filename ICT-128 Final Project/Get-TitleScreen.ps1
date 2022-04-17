function Get-TitleScreen { 
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
    
    Write-Host `
    "






             ▄▄▄       █    ██  ██▓███   ██▓     ▒█████ ▓██   ██▓
            ▒████▄     ██  ▓██▒▓██░  ██▒▓██▒    ▒██▒  ██▒▒██  ██▒
            ▒██  ▀█▄  ▓██  ▒██░▓██░ ██▓▒▒██░    ▒██░  ██▒ ▒██ ██░
            ░██▄▄▄▄██ ▓▓█  ░██░▒██▄█▓▒ ▒▒██░    ▒██   ██░ ░ ▐██▓░
             ▓█   ▓██▒▒▒█████▓ ▒██▒ ░  ░░██████▒░ ████▓▒░ ░ ██▒▓░
             ▒▒   ▓▒█░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░░ ▒░▓  ░░ ▒░▒░▒░   ██▒▒▒ 
              ▒   ▒▒ ░░░▒░ ░ ░ ░▒ ░     ░ ░ ▒  ░  ░ ▒ ▒░ ▓██ ░▒░ 
              ░   ▒    ░░░ ░ ░ ░░         ░ ░   ░ ░ ░ ▒  ▒ ▒ ░░  
                     ░  ░   ░                  ░  ░    ░ ░  ░ ░     
                                                            ░ ░     

           Author: Vesec
           V.0.4

           ---------------Windows Server Tools-------------------
           ------------------------------------------------------

                   Tools:

                   --------------------------------------
                   ------------SERVER TOOLS--------------
                   
                   1. Create VM Host or Server
                   2. Automation Tools Menu


                   --------------------------------------
                   -----------DOMAIN PC TOOLS------------

                   3. Set Static Default Settings Host PC
                   4. Add a Host PC To a Domain


                   --------------------------------------
                   -------------EXTRA TOOLS---------------

                   5. Standalone Setup Tools (Incomplete)
                   6. Exit

                   
"

Get-UserSelection
Get-TitleFunctions
}