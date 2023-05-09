$resources = @(
	@("background.jpg", "$Env:SystemRoot\background.jpg"),
	@("code\keybindings.json", "$Env:UserProfile\AppData\Roaming\Code\User\keybindings.json"),
	@("code\main.code-snippets", "$Env:UserProfile\AppData\Roaming\Code\User\snippets\main.code-snippets"),
	@("code\settings.json", "$Env:UserProfile\AppData\Roaming\Code\User\settings.json"),
	@("powershell.ps1", "$Env:UserProfile\Documents\PowerShell\profile.ps1"),
	@("start.xml", "$Env:SystemRoot\start.xml"),
	@("terminal.json", "$Env:UserProfile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json")
)
