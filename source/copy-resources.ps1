function copyResources {
	Write-Host "Copying resources..." -NoNewline
	$args[0] | ForEach-Object {
		$source = $_[0]
		$destination = $_[1]
		$null = New-Item -Force -ItemType File -Path $destination
		Copy-Item -Destination $destination -Force -Path "$PSScriptRoot\..\resources\$source"
	}
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
