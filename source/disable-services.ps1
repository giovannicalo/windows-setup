function disableServices {
	Write-Host "Disabling services..." -NoNewline
	$args[0] | ForEach-Object {
		Stop-Service -Name $_
		Set-Service -Name $_ -StartupType Disabled
	}
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
