function killsteam() {
	taskkill /IM 'Steam.exe' /F

	$steamIcon = [Char]0xf1b6
        Write-Host "$steamIcon Steam successfully stopped" -ForegroundColor Green -NoNewline
}
