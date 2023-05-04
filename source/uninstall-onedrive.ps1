function uninstallOneDrive {
	Write-Host "Uninstalling OneDrive..." -NoNewline
	Stop-Process -ErrorAction SilentlyContinue -Name OneDrive
	Start-Process -ArgumentList "/uninstall" -FilePath "$Env:SystemRoot\SysWOW64\OneDriveSetup.exe" -Wait
	Start-Sleep 5
	Remove-Item Env:OneDrive -ErrorAction SilentlyContinue
	Remove-Item "$Env:UserProfile\OneDrive" -ErrorAction SilentlyContinue -Force -Recurse
	Remove-Item "$Env:LocalAppData\Microsoft\OneDrive" -ErrorAction SilentlyContinue -Force -Recurse
	Remove-Item "$Env:ProgramData\Microsoft OneDrive" -ErrorAction SilentlyContinue -Force -Recurse
	Write-Host " [DONE]" -ForegroundColor "Green"
}
