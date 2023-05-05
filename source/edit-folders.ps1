function editFolders {
	Write-Host "Editing folders."
	Write-Host
	$args[0] | ForEach-Object {
		if (!($_)) {
			return
		}
		$path = $_[0]
		$action = $_[1]
		$isSet = Test-Path $path
		if ($action -eq "SET" -and !$isSet) {
			$null = New-Item -Force -ItemType Directory -Path $path
		}
		if ($action -eq "UNSET" -and $isSet) {
			Remove-Item -Force -Path $path -Recurse
		}
		$previousValue = "[UNSET]"
		if ($isSet) {
			$previousValue = "[SET]"
		}
		$previousValueColor = "Red"
		if ($previousValue -eq "[$action]") {
			$previousValueColor = "Yellow"
		}
		Write-Host "  ${path}: " -NoNewline
		Write-Host $previousValue -ForegroundColor $previousValueColor -NoNewline
		Write-Host " => " -NoNewline
		Write-Host "[$action]" -ForegroundColor "Green"
	}
	Write-Host
	Write-Host "[DONE]" -ForegroundColor "Green"
	Write-Host
}
