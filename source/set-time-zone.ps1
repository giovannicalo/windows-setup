function setTimeZone {
	Write-Host "Setting time zone..." -NoNewline
	Set-TimeZone -Id "GMT Standard Time"
	Write-Host " [DONE]" -ForegroundColor "Green"
}
