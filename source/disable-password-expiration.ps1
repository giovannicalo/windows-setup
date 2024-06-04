function disablePasswordExpiration {
	Write-Host "Disabling password expiration..." -NoNewline
	Set-LocalUser -Name root -PasswordNeverExpires $True
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
