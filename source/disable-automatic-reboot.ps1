function disableAutomaticReboot {
	Write-Host "Disabling automatic reboot..." -NoNewline
	$null = takeown /f $Env:SystemRoot\System32\MusNotification.exe
	$null = icacls $Env:SystemRoot\System32\MusNotification.exe /deny "Everyone:(X)"
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
