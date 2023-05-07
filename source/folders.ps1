$folders = @(
	# Remove OneDrive leftovers
	@("$Env:LocalAppData\Microsoft\OneDrive", "UNSET"),
	# Remove OneDrive leftovers
	@("$Env:ProgramData\Microsoft OneDrive", "UNSET"),
	# Create bin folder
	@("$Env:UserProfile\bin", "SET"),
	# Create dev folder
	@("$Env:UserProfile\dev", "SET"),
	# Create lib folder
	@("$Env:UserProfile\lib", "SET"),
	# Remove OneDrive leftovers
	@("$Env:UserProfile\OneDrive", "UNSET")
)
