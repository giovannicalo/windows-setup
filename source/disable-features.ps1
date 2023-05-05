function disableFeatures {
	Write-Host "Disabling optional features..." -NoNewline
	$features = $args[0]
	$null = Get-WindowsOptionalFeature -Online | Where-Object {
		$_.FeatureName -in $features -and $_.State -eq "Enabled"
	} | Disable-WindowsOptionalFeature -NoRestart -Online -WarningAction SilentlyContinue
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
