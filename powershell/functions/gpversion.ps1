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
hotfix            Increase the build by 1 (major.minor.build.revision)
set <version>     Set the version sent by parameter
        "
        Return
    }

    $file = "$env:GP_PATH\SP06ICH001\My Project\AssemblyInfo.vb"

    $sr = new-object System.IO.StreamReader( $file, [System.Text.Encoding]::GetEncoding("utf-8") )
    $content = $sr.ReadToEnd()
    $sr.Close()

    $reg = [regex]"(\d+)\.(\d+)\.(\d+)"
    $currentVersion = $reg.Match($content).Value
    
    if ( $mode -eq "get" ){
        Write-Host " Current version: $currentVersion" -ForegroundColor Blue
        Return
    }

    if ( $mode -eq "add" ){
        $versionSplit = $currentVersion.Split(".")
        $newVersion = $versionSplit[0] + "." + (([int]$versionSplit[1]) + 1) + ".0" 
    }

    if ( $mode -eq "hotfix" ){
        $versionSplit = $currentVersion.Split(".")
        $newVersion = $versionSplit[0] + "." + $versionSplit[1] + "." + (([int]$versionSplit[2]) + 1)
    }

    if ( $mode -eq "add" -or $mode -eq "hotfix" -or $mode -eq "set" ){
        Write-Host " $currentVersion  $newVersion" -ForegroundColor Green
        setGestPathVersion $newVersion
        return $newVersion
    }

    Write-Error '❌ Invalid argument. Try using gpversion help' -ErrorAction Stop

}

function setGestPathVersion($version) {
    $file = "$env:GP_PATH\SP06ICH001\My Project\AssemblyInfo.vb"

    $sr = new-object System.IO.StreamReader( $file, [System.Text.Encoding]::GetEncoding("utf-8") )
    $content = $sr.ReadToEnd()
    $sr.Close()

    $content = [Regex]::Replace($content, "(\d+)\.(\d+)\.(\d+)", $newVersion);

    $sw = new-object System.IO.StreamWriter( $file, $false, [System.Text.Encoding]::GetEncoding("utf-8") )
    $sw.Write( $content )
    $sw.Close()
    
    Return    
}

function setGPAPIVersion($version) {
    $file = "$env:GPAPI_PATH\pom.xml"

    $sr = new-object System.IO.StreamReader( $file, [System.Text.Encoding]::GetEncoding("utf-8") )
    $content = $sr.ReadToEnd()
    $sr.Close()

    [regex]$pattern = "<version>(\d+)\.(\d+)\.(\d+)[\.(\d+)]*<\/version>"
    $content = $pattern.replace($content, "<version>$newVersion</version>", 1);

    $sw = new-object System.IO.StreamWriter( $file, $false, [System.Text.Encoding]::GetEncoding("utf-8") )
    $sw.Write( $content )
    $sw.Close()

    Return
}