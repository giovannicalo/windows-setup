function Prompt {
	Write-Host " $Env:UserName @ $($Env:ComputerName.ToLower()) " -BackgroundColor "Green" -ForegroundColor "Black" -NoNewline
	Write-Host "" -BackgroundColor "DarkCyan" -ForegroundColor "Green" -NoNewline
	Write-Host " $((Get-Location).Path.Replace($Env:UserProfile, "~")) " -BackgroundColor "DarkCyan" -ForegroundColor "Black" -NoNewline
	Write-Host "" -BackgroundColor "Magenta" -ForegroundColor "DarkCyan" -NoNewline
	Write-Host " $(Get-Date -Format "yyyy-MM-dd HH:mm:ss") " -BackgroundColor "Magenta" -ForegroundColor "Black" -NoNewline
	Write-Host "" -ForegroundColor "Magenta"
	Write-Host "❯" -ForegroundColor "DarkYellow" -NoNewline
	return " "
}
