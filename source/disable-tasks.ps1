function disableTasks {
	Write-Host "Disabling scheduled tasks..." -NoNewline
	$tasks = $args[0]
	$null = Get-ScheduledTask | Where-Object {
		$_.TaskName -in $tasks -and $_.State -eq "Ready"
	} | Disable-ScheduledTask
	Write-Host " [DONE]" -ForegroundColor "Green"
	Write-Host
}
