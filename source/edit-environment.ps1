function editEnvironment {
	Write-Host "Editing environment variables."
	Write-Host
	$args[0] | ForEach-Object {
		if (!($_)) {
			return
		}
		$type = $_[0]
		$variables = $_[1]
		Write-Host $type
		$variables | ForEach-Object {
			if (!($_)) {
				return
			}
			$name = $_[0]
			$value = $_[1]
			$previousValue = [Environment]::GetEnvironmentVariable($name, $type)
			[Environment]::SetEnvironmentVariable($name, $value, $type)
			$previousValueColor = "Red"
			if ($previousValue -eq $value) {
				$previousValueColor = "Yellow"
			}
			if (!($previousValue)) {
				$previousValue = "[UNSET]"
			}
			if (!($value)) {
				$value = "[UNSET]"
			}
			Write-Host "  ${name}: " -NoNewline
			Write-Host $previousValue -ForegroundColor $previousValueColor -NoNewline
			Write-Host " => " -NoNewline
			Write-Host $value -ForegroundColor "Green"
		}
		Write-Host
	}
	Write-Host "[DONE]" -ForegroundColor "Green"
	Write-Host
}
