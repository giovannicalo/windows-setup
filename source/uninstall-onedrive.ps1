function uninstallOneDrive {
	# TODO: Check if OneDrive is installed
	Write-Host "Uninstalling OneDrive..." -NoNewline
	Stop-Process -ErrorAction SilentlyContinue -Name OneDrive
	Start-Process -ArgumentList "/uninstall" -FilePath "$Env:SystemRoot\SysWOW64\OneDriveSetup.exe" -Wait
	Start-Sleep 5
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
