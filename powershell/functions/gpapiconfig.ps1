function gpapiconfig($1, $2){
    $DEBUG_PATH = $env:GPAPI_PATH + "/src/main/Resources"
    $CONFIG_PATH = $env:USERPROFILE + "\.config\powershell\functions\gpapiconfig-files"

    if ( $1 -eq "help" ){
        Write-Output "
gpapiconfig <command>

Usage:

Commands          Action
===============================================================================
change <name>     Set the specified file to the GPAPI working directory
files             Display all the available saved files
edit              Edit the current config file with the 'probably' best code editor
save <name>       Save the current file with the specified name
        "
        Return
    }

    if ( $1 -eq "files" ){
        Get-ChildItem -Path $CONFIG_PATH | where {$_.extension -in @(".yml")}
        Return
    }

    if ( $1 -eq "edit" ){
        nvim $DEBUG_PATH/application.yml
        Return
    }

    if ( $1 -eq "save" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified'
        }
        cp $DEBUG_PATH/application.yml $CONFIG_PATH/config_$2.yml
        Write-Host "💾 Current config file saved as config_$2.yml" -ForegroundColor Green -NoNewline
        Return
    }

    if ( $1 -eq "change" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified'
            Return
        }

        if (Test-Path -Path $CONFIG_PATH/config_$2.yml){
            cp $CONFIG_PATH/config_$2.yml $DEBUG_PATH/application.yml
            Write-Host "✔️ Config file changed to config_$2.yml" -ForegroundColor Green -NoNewline
            Return
        }else{
            Write-Error "❌ Config file $2 does not exist"
            Return
        }
    }

    Write-Error '❌ Invalid argument. Try using gpapiconfig help'

}