function removeApps {
	Write-Host "Removing store apps..." -NoNewline
	$apps = $args[0]
	$null = Get-AppxProvisionedPackage -Online | Where-Object {
		$_.DisplayName -in $apps
	} | Remove-AppxProvisionedPackage -Online
	$null = Get-AppxPackage -AllUsers | Where-Object {
		$_.Name -in $apps
	} | Remove-AppxPackage -AllUsers
	Write-Host " [DONE]" -ForegroundColor "Green"
}
