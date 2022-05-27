function clearmysql() {
	Get-ChildItem -Path $env:APPDATA/MySQL/Workbench/sql_history -Include * -File -Recurse | foreach { $_.Delete() }
        Write-Host " Mysql history cleared" -ForegroundColor Green -NoNewline
}
