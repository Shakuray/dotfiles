function gpversiongit($mode, $newVersion)
{
    cd $env:GP_PATH
    git pull
    cd $env:GPAPI_PATH
    git pull
    
    $newversion = gpversion $mode $newVersion

    cd $env:GP_PATH
    git add "$env:GP_PATH\SP06ICH001\My Project\AssemblyInfo.vb"
    git commit -m "Release: $newVersion"
    git tag $newVersion
    git push --tags
    git push -u origin 2.5

    cd $env:GPAPI_PATH
    git add "$env:GPAPI_PATH\pom.xml"
    git commit -m "Release: $newVersion"
    git tag $newVersion
    git push --tags
    git push -u origin master
}