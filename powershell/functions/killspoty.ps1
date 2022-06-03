function killspoty() {
	taskkill /IM 'Spotify.exe' /F

        $spotyIcon = [Char]0xf1bc
        Write-Host "$spotyIcon Spotify successfully restarted" -ForegroundColor Green -NoNewline
	& $env:APPDATA\Spotify\Spotify.exe
}
