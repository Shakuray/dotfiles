function npmcache() {
	Remove-Item $env:APPDATA\..\Local\npm-cache\_logs\* -Recurse -Force -erroraction 'silentlycontinue'

        $npmIcon = ""
        Write-Host "$npmIcon NPM cache cleared" -ForegroundColor Green -NoNewline
}
