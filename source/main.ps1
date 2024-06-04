$isPowerShellCore = $PSEdition -eq "Core"

if (!(([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
	$program = if ($isPowerShellCore) {
		"pwsh"
	} else {
		"powershell"
	}
	Start-Process $program -ArgumentList "$PSCommandPath external" -Verb RunAs -Wait
	Exit
}

if ($isPowerShellCore) {
	Import-Module Appx -UseWindowsPowerShell -WarningAction SilentlyContinue
}

. (Join-Path $PSScriptRoot ".\apps.ps1")
. (Join-Path $PSScriptRoot ".\copy-resources.ps1")
. (Join-Path $PSScriptRoot ".\disable-automatic-reboot.ps1")
. (Join-Path $PSScriptRoot ".\disable-features.ps1")
. (Join-Path $PSScriptRoot ".\disable-password-expiration.ps1")
. (Join-Path $PSScriptRoot ".\disable-services.ps1")
. (Join-Path $PSScriptRoot ".\disable-tasks.ps1")
. (Join-Path $PSScriptRoot ".\display-footer.ps1")
. (Join-Path $PSScriptRoot ".\display-header.ps1")
. (Join-Path $PSScriptRoot ".\edit-environment.ps1")
. (Join-Path $PSScriptRoot ".\edit-folders.ps1")
. (Join-Path $PSScriptRoot ".\edit-registry.ps1")
. (Join-Path $PSScriptRoot ".\entries.ps1")
. (Join-Path $PSScriptRoot ".\features.ps1")
. (Join-Path $PSScriptRoot ".\folders.ps1")
. (Join-Path $PSScriptRoot ".\remove-apps.ps1")
. (Join-Path $PSScriptRoot ".\resources.ps1")
. (Join-Path $PSScriptRoot ".\set-time-zone.ps1")
. (Join-Path $PSScriptRoot ".\services.ps1")
. (Join-Path $PSScriptRoot ".\tasks.ps1")
. (Join-Path $PSScriptRoot ".\uninstall-onedrive.ps1")
. (Join-Path $PSScriptRoot ".\variables.ps1")

displayHeader

setTimeZone

editEnvironment $variables

editRegistry $entries

disablePasswordExpiration

disableAutomaticReboot

disableServices $services

disableTasks $tasks

disableFeatures $features

removeApps $apps

uninstallOneDrive

editFolders $folders

copyResources $resources

Stop-Process -Name explorer

displayFooter

if ($args[0] -eq "external") {
	Write-Host "Press any key to exit..."
	$null = $Host.UI.RawUI.ReadKey("IncludeKeyDown, NoEcho")
}
