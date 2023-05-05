function uninstallOneDrive {
	Write-Host "Uninstalling OneDrive..." -NoNewline
	Stop-Process -ErrorAction SilentlyContinue -Name OneDrive
	Start-Process -ArgumentList "/uninstall" -FilePath "$Env:SystemRoot\SysWOW64\OneDriveSetup.exe" -Wait
	Write-Host " [DONE]" -ForegroundColor "Green"
}
