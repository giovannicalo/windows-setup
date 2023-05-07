function editRegistry {
	Write-Host "Editing registry."
	Write-Host
	$null = New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
	$args[0] | ForEach-Object {
		if (!($_)) {
			return
		}
		$drives = $_[0]
		$path = $_[1]
		$keys = $_[2]
		$drives | ForEach-Object {
			if (!($_)) {
				return
			}
			$drive = $_
			$fullPath = "${drive}:\$path"
			Write-Host $fullPath
			if ($keys -eq "UNSET") {
				$previousValue = "[UNSET]"
				$previousValueColor = "Yellow"
				if (Test-Path $fullPath) {
					$previousValue = "[SET]"
					$previousValueColor = "Red"
					Remove-Item -Force -Path $fullPath -Recurse
				}
				Write-Host "  $previousValue" -ForegroundColor $previousValueColor -NoNewline
				Write-Host " => " -NoNewline
				Write-Host "[UNSET]" -ForegroundColor "Green"
				Write-Host
				return
			}
			$keys | ForEach-Object {
				if (!($_)) {
					return
				}
				$name = $_[0]
				$value = $_[1]
				if (!(Test-Path $fullPath)) {
					$null = New-Item -Force -Path $fullPath
				}
				$previousValueColor = "Red"
				$previousValue = try {
					Get-ItemPropertyValue -ErrorAction Stop -Name $name -Path $fullPath
				} catch {
					"[UNSET]"
				}
				if ($previousValue -eq $value) {
					$previousValueColor = "Yellow"
				}
				Set-ItemProperty -Name $name -Path $fullPath -Value $value
				Write-Host "  ${name}: " -NoNewline
				Write-Host $previousValue -ForegroundColor $previousValueColor -NoNewline
				Write-Host " => " -NoNewline
				Write-Host $value -ForegroundColor "Green"
			}
			Write-Host
		}
	}
	Write-Host "[DONE]" -ForegroundColor "Green"
	Write-Host
}
