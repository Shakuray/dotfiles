function gpversion($mode, $newVersion)
{
    if ( $mode -eq "help" ){
        Write-Output "
gpversion <command>

Usage:

Commands          Action
===============================================================================
get               Retrieve the current version
add               Increase the revision by 1 (major.minor.build.revision)
set <version>     Set the version sent by parameter
        "
        Return
    }

    $file = "$env:GP_PATH\SP06ICH001\My Project\AssemblyInfo.vb"
    $fileObject = get-item $file

    $sr = new-object System.IO.StreamReader( $file, [System.Text.Encoding]::GetEncoding("utf-8") )
    $content = $sr.ReadToEnd()
    $sr.Close()

    $reg = [regex]"(\d+)\.(\d+)\.(\d+)[\.(\d+)]*"
    $currentVersion = $reg.Match($content).Value
    
    if ( $mode -eq "get" ){
        Write-Host " Current version: $currentVersion" -ForegroundColor Blue
        Return
    }

    if ( $mode -eq "add" ){
        $versionSplit = $currentVersion.Split(".")
        $newVersion = $versionSplit[0] + "." + $versionSplit[1] + "." + $versionSplit[2] + "." + (([int]$versionSplit[3]) + 1)
    }

    if ( $mode -eq "add" -or $mode -eq "set" ){
        Write-Host " $currentVersion  $newVersion" -ForegroundColor Green

        $content = [Regex]::Replace($content, "(\d+)\.(\d+)\.(\d+)[\.(\d+)]*", $newVersion);

        $sw = new-object System.IO.StreamWriter( $file, $false, [System.Text.Encoding]::GetEncoding("utf-8") )
        $sw.Write( $content )
        $sw.Close()
        Return
    }

    Write-Error '❌ Invalid argument. Try using gpversion help' -ErrorAction Stop

}