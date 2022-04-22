function killspoty() {
	taskkill /IM 'Spotify.exe' /F

        $spotyIcon = [Char]0xf1bc
        Write-Host "$spotyIcon Spotify successfully stopped" -ForegroundColor Green -NoNewline
}
