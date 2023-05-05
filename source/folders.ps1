$folders = @(
	# Remove OneDrive leftovers
	@("$Env:LocalAppData\Microsoft\OneDrive", "UNSET"),
	# Remove OneDrive leftovers
	@("$Env:ProgramData\Microsoft OneDrive", "UNSET"),
	# Create development folder
	@("$Env:UserProfile\Development", "SET"),
	# Remove OneDrive leftovers
	@("$Env:UserProfile\OneDrive", "UNSET")
)
