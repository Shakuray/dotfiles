function gpconfig($1, $2){
    $DEBUG_PATH = $env:GP_PATH + "/SP06ICH001/bin/Debug"
    $CONFIG_PATH = $env:USERPROFILE + "\.config\powershell\functions\gpconfig-files"

    if ( $1 -eq "help" ){
        Write-Output "
gpconfig <command>

Usage:

Commands          Action
===============================================================================
change <name>     Set the specified file to the GP working directory
files             Display all the available saved files
edit              Edit the current config file with the 'probably' best code editor
save <name>       Save the current file with the specified name
        "
        Return
    }

    if ( $1 -eq "files" ){
        Get-ChildItem -Path $CONFIG_PATH | where {$_.extension -in @(".xml")}
        Return
    }

    if ( $1 -eq "edit" ){
        nvim $DEBUG_PATH/config.xml
        Return
    }

    if ( $1 -eq "save" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified' -ErrorAction Stop
        }
        cp $DEBUG_PATH/config.xml $CONFIG_PATH/config_$2.xml
        Write-Output "💾 Current config file saved as config_$2.xml"
        Return
    }

    if ( $1 -eq "change" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified' -ErrorAction Stop
        }
        cp $CONFIG_PATH/config_$1.xml $DEBUG_PATH/config.xml
        Write-Output "✔️ Config file changed to config_$1.xml"
        Return
    }

    Write-Error '❌ Invalid argument. Try using gpconfig help' -ErrorAction Stop

}