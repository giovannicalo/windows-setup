$variables = @(
	@("Machine", @(
		# Only execute files with the right extensions
		@("PATHEXT", ".bat;.exe"),
		# Disable PowerShell telemetry
		@("POWERSHELL_TELEMETRY_OPTOUT", "1"),
		$null
	)),
	@("User", @(
		# Remove OneDrive leftovers
		@("OneDrive", $null),
		$null
	)),
	$null
)
