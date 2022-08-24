function sphapiconfig($1, $2){
    $CONFIG_PATH = $env:USERPROFILE + "\.config\powershell\functions\sphapiconfig-files"

    if ( $1 -eq "help" ){
        Write-Output "
sphconfig <command>

Usage:

Commands          Action
===============================================================================
change <name>     Set the specified file to the Sphere working directory
files             Display all the available saved files
edit              Edit the current config file with the 'probably' best code editor
save <name>       Save the current file with the specified name
        "
        Return
    }

    if ( $1 -eq "files" ){
        Get-ChildItem -Path $CONFIG_PATH | where {$_.name -like "*.env*"}
        Return
    }

    if ( $1 -eq "edit" ){
        code $env:SPHAPI_PATH/.env
        Return
    }

    if ( $1 -eq "save" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified'
        }
        cp $env:SPHAPI_PATH/.env $CONFIG_PATH/.env.$2
        Write-Host "💾 Current config file saved as .env.$2" -ForegroundColor Green -NoNewline
        Return
    }

    if ( $1 -eq "change" ){
        if ($2 -eq $null){
            Write-Error '❌ A config name must be specified'
            Return
        }

        if (Test-Path -Path $CONFIG_PATH/.env.$2){
            cp $CONFIG_PATH/.env.$2 $env:SPHAPI_PATH/.env
            Write-Host "✔️ Sphere API env file changed to .env.$2" -ForegroundColor Green -NoNewline
            Return
        }else{
            Write-Error "❌ Config file .env.$2 does not exist"
            Return
        }
    }

    Write-Error '❌ Invalid argument. Try using sphconfig help'

}