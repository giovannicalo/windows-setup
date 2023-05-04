$paint3dEntries = @("3mf", "bmp", "fbx", "gif", "glb", "jfif", "jpe", "jpeg", "jpg", "obj", "ply", "png", "stl", "tif", "tiff") | ForEach-Object {
	# Remove 3D Edit from context menu
	@((@("HKLM", $null), "Software\Classes\SystemFileAssociations\.$_\Shell\3D Edit", "UNSET"), $null)
}

$otherEntries = @(
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Policies\System", @(
		# Display last successful login and failed login attempts on login
		@("DisplayLastLogonInfo", 1),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\AdvertisingInfo", @(
		# Disable advertising ID
		@("DisabledByGroupPolicy", 1),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\CloudContent", @(
		# Disable some web content [TODO: Verify]
		@("DisableCloudOptimizedContent", 1),
		# Disable Windows Tips [TODO: Verify]
		@("DisableSoftLanding", 1),
		# Disable recommended content [TODO: Verify]
		@("DisableWindowsConsumerFeatures", 1)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\GameDVR", @(
		# Disable Xbox Bar recording
		@("AllowGameDVR", 0),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\Personalization", @(
		# Set lock screen background image
		@("LockScreenImage", "$Env:SystemRoot\background.jpg"),
		# Disallow editing lock screeen
		@("NoChangingLockScreen", 1)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\System", @(
		# Disable clipboard history
		@("AllowClipboardHistory", 0),
		# Disallow changing network on lock screen
		@("DontDisplayNetworkSelectionUI", 1),
		# Disable Activity History
		@("PublishUserActivities", 0),
		# Prevent sharing Activity History
		@("UploadUserActivities", 0)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\WindowsInkWorkspace", @(
		# Disable Windows Ink
		@("AllowWindowsInkWorkspace", 0),
		$null
	)),
	@(@("HKLM", $null), "System\CurrentControlSet\Control\FileSystem", @(
		# Remove path length limit
		@("LongPathsEnabled", 1),
		$null
	)),
	# Remove Downloads folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088E3905-0323-4B02-9826-5D99428E115F}", "UNSET"),
	# Remove 3D Objects folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}", "UNSET"),
	# Remove Pictures folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24AD3AD4-A569-4530-98E1-AB02F9417AA8}", "UNSET"),
	# Remove Music folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3DFDF296-DBEC-4FB4-81D1-6A3438BCF4DE}", "UNSET"),
	# Remove Desktop folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}", "UNSET"),
	# Remove Documents folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D3162B92-9365-467A-956B-92703ACA08AF}", "UNSET"),
	# Remove Videos folder from Explorer
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{F86FA3AB-70D2-4FC7-9C99-FCBF05467F3A}", "UNSET"),
	@(@("HKLM", $null), "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", @(
		# Disable web tips in Settings
		@("AllowOnlineTips", 0),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\InputPersonalization", @(
		# Disable online speech recognition
		@("AllowInputPersonalization", 0),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Edge", @(
		# Prevent Edge from saving and autofilling addresses
		@("AutofillAddressEnabled", 0),
		# Prevent Edge from saving and autofilling credit cards
		@("AutofillCreditCardEnabled", 0),
		# Prevent Edge from running in the background
		@("BackgroundModeEnabled", 0),
		# Delete Edge browsing data on exit
		@("ClearBrowsingDataOnExit", 0),
		# Set download directory
		@("DownloadDirectory", "$Env:Home\Desktop")
		# Disable Edge's sidebar
		@("HubsSidebarEnabled", 0),
		# Prevent Edge from sharing data with Windows
		@("LocalBrowserDataShareEnabled", 0),
		# Prevent Edge from saving passwords
		@("PasswordManagerEnabled", 0),
		# Remove reveal button from password input fields in Edge
		@("PasswordRevealEnabled", 0),
		# Prevent websites from querying payment methods in Edge
		@("PaymentMethodQueryEnabled", 0),
		# Prevent Edge from autofilling passwords
		@("PrimaryPasswordSetting", 3),
		# Disable Microsoft Rewards in Edge
		@("ShowMicrosoftRewards", 0),
		# Prevent Edge from starting in the background
		@("StartupBoostEnabled", 0),
		# Set Edge tracking prevention to strict
		@("TrackingPrevention", 3),
		# Disable Edge search bar on desktop [TODO: Verify]
		@("WebWidgetIsEnabledOnStartup", 0)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\FVE", @(
		# Disable direct memory access while the system is locked [TODO: Verify]
		@("DisableExternalDMAUnderLock", 1),
		# Enable BitLocker without TPM
		@("EnableBDEWithNoTPM", 1),
		# Set cipher to AES-XTS 256-bit for fixed drives
		@("EncryptionMethodWithXtsFdv", 7),
		# Set cipher to AES-XTS 256-bit for system drives
		@("EncryptionMethodWithXtsOs", 7),
		# Set cipher to AES-XTS 256-bit for removable drives
		@("EncryptionMethodWithXtsRdv", 4),
		# Allow using smart cards for fixed drives
		@("FDVAllowUserCert", 1),
		# Enforce full disk encryption for fixed drives
		@("FDVEncryptionType", 1),
		# Allow using passwords for fixed drives
		@("FDVPassphrase", 1),
		# Allow using smart cards for system drives
		@("OSAllowUserCert", 1),
		# Enforce full disk encryption for system drives
		@("OSEncryptionType", 1),
		# Allow using passwords for system drives
		@("OSPassphrase", 1),
		# Allow using smart cards for removable drives
		@("RDVAllowUserCert", 1),
		# Enforce full disk encryption for removable drives
		@("RDVEncryptionType", 1),
		# Allow using passwords for removable drives
		@("RDVPassphrase", 1),
		# Enable BitLocker setup options
		@("UseAdvancedStartup", 1),
		# Allow all characters in PINs [TODO: Verify]
		@("UseEnhancedPin", 1),
		# Allow using TPM
		@("UseTPM", 2),
		# Allow using TPM and key
		@("UseTPMKey", 1),
		# Allow Using TPM, PIN and key [TODO: Verify]
		@("UseTPMKeyPIN", 1),
		# Allow using TPM and PIN
		@("UseTPMPIN", 1)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\SQMClient\Windows", @(
		# Disable Customer Experience Improvement Program [TODO: Verify]
		@("CEIPEnable", 0),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\Windows Feeds", @(
		# Disable taskbar news
		@("EnableFeeds", 0),
		$null
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\Windows Search", @(
		# Disable cloud content search
		@("AllowCloudSearch", 0),
		# Disable Cortana
		@("AllowCortana", 0),
		# Disable web search in start menu
		@("ConnectedSearchUseWeb", 0)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\WindowsUpdate", @(
		# Disable automatic wake to install updates [TODO: Verify]
		@("AUPowerManagement", 0),
		# Disable reboot notifications after installing updates
		@("SetAutoRestartNotificationDisable", 1)
	)),
	@(@("HKLM", $null), "Software\Policies\Microsoft\Windows\WindowsUpdate\AU", @(
		# Notify the user before downloading updates
		@("AUOptions", 0),
		# Prevent automatic reboot after installing updates
		@("NoAutoRebootWithLoggedOnUsers", 1)
	)),
	@(@("HKCU", $null), "Control Panel\International", @(
		# Set first day of the week to Monday
		@("iFirstDayOfWeek", 0),
		# Set long date format to DDDD D MMMM YYYY
		@("sLongDate", "dddd d MMMM yyyy")
		# Set short date format to YYYY-MM-DD
		@("sShortDate", "yyyy-MM-dd"),
		# Set short time format to HH:MM
		@("sShortTime", "HH:mm"),
		# Set long time format to HH:MM:SS
		@("sTimeFormat", "HH:mm:ss")
	)),
	@(@("HKCU", $null), "Software\Classes\TypeLib\{8CEC5860-07A1-11D9-B15E-000D56BFE6EE}\1.0\0\win64", @(
		# Prevent F1 from launching Edge
		@("(Default)", ""),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\GameBar", @(
		# Disable Game Mode
		@("AutoGameModeEnabled", 0),
		# Disable launching Xbox Game Bar from controller
		@("UseNexusForGameBarEnabled", 0)
	)),
	@(@("HKCU", $null), "Software\Microsoft\InputPersonalization", @(
		# Disable inking personalization
		@("RestrictImplicitInkCollection", 1),
		# Disable typing personalization
		@("RestrictImplicitTextCollection", 1)
	)),
	@(@("HKCU", $null), "Software\Microsoft\InputPersonalization\TrainedDataStore", @(
		# Prevent using contacts for typing suggestions
		@("HarvestContacts", 0),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Personalization\Settings", @(
		# Disable input personalization
		@("AcceptedPrivacyPolicy", 0),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", @(
		# Prevent apps from getting installed again [TODO: Verify]
		@("ContentDeliveryAllowed", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("FeatureManagementEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("OemPreInstalledAppsEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("PreInstalledAppsEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("PreInstalledAppsEverEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("SilentInstalledAppsEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("SoftLandingEnabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("SubscribedContentEnabled", 0),
		# Disable suggestions in settings
		@("SubscribedContent-338393Enabled", 0),
		# Disable suggestions in settings
		@("SubscribedContent-353694Enabled", 0),
		# Disable suggestions in settings
		@("SubscribedContent-353696Enabled", 0),
		# Prevent apps from getting installed again [TODO: Verify]
		@("SystemPaneSuggestionsEnabled", 0)
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", @(
		# Show hidden files
		@("Hidden", 1),
		# Show file extensions
		@("HideFileExt", 0),
		# Start explorer on drive list
		@("LaunchTo", 1),
		# Remove task view button from taskbar
		@("ShowTaskViewButton", 0),
		# Never combine taskbar items
		@("TaskbarGlomLevel", 2),
		# Use thin taskbar
		@("TaskbarSmallIcons", 1)
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People", @(
		# Remove people icon from taskbar
		@("PeopleBand", 0),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers", @(
		# Disable AutoPlay
		@("DisableAutoplay", 1),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager", @(
		# Show graph on file operations dialog
		@("EnthusiastMode", 1),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", @(
		# Show icons in Control Panel
		@("ForceClassicControlPanel", 1),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Policies\System", @(
		# Set the wallpaper
		@("Wallpaper", "$Env:SystemRoot\background.jpg"),
		# Set the wallpaper style to fill
		@("WallpaperStyle", 4)
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Search", @(
		# Remove search box from taskbar
		@("SearchboxTaskbarMode", 0),
		$null
	)),
	@(@("HKCU", $null), "Software\Microsoft\Windows\CurrentVersion\Themes\Personalize", @(
		# Use dark mode
		@("AppsUseLightTheme", 0),
		$null
	)),
	@(@("HKCU", $null), "Software\Policies\Microsoft\Control Panel\International", @(
		# Disable autocorrect for software keyboard
		@("TurnOffAutocorrectMisspelledWords", 1),
		$null
	)),
	@(@("HKCU", $null), "Software\Policies\Microsoft\Windows\CloudContent", @(
		# Disable tailored experiences
		@("DisableTailoredExperiencesWithDiagnosticData", 1),
		# Disable Windows Spotlight [TODO: Verify]
		@("DisableWindowsSpotlightFeatures", 1),
		# Disable recommendations in Action Center [TODO: Verify]
		@("DisableWindowsSpotlightOnActionCenter", 1),
		# Disable recommendations in settings [TODO: Verify]
		@("DisableWindowsSpotlightOnSettings", 1),
		# Disable launching Edge after updates [TODO: Verify]
		@("DisableWindowsSpotlightWindowsWelcomeExperience", 1)
	)),
	@(@("HKCU", $null), "Software\Policies\Microsoft\Windows\Explorer", @(
		# Disable search history in explorer
		@("DisableSearchBoxSuggestions", 1),
		# Disable showing Edge tabs in app switcher
		@("MultiTaskingAltTabFilter", 4),
		# Prevent uninstalling apps from start menu
		@("NoUninstallFromStart", 1),
		# Remove pins from taskbar
		@("TaskbarNoPinnedList", 1)
	)),
	@(@("HKLM", "HKCU"), "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", @(
		# Disable AutoPlay for non-volumes [TODO: Verify]
		@("NoAutoplayForNonVolume", 1),
		# Disable AutoRun commands [TODO: Verify]
		@("NoAutorun", 1),
		# Disable AutoPlay for all drives [TODO: Verify]
		@("NoDriveTypeAutoRun", 255),
		# Disable recent files history
		@("NoRecentDocsHistory", 1)
	)),
	@(@("HKLM", "HKCU"), "Software\Policies\Microsoft\Windows\CredUI", @(
		# Remove reveal button from password input fields
		@("DisablePasswordReveal", 0),
		$null
	)),
	@(@("HKLM", "HKCU"), "Software\Policies\Microsoft\Windows\DataCollection", @(
		# Disable telemetry
		@("AllowTelemetry", 0),
		$null
	)),
	@(@("HKLM", "HKCU"), "Software\Policies\Microsoft\Windows\Explorer", @(
		# Remove recently added apps from start menu
		@("HideRecentlyAddedApps", 1),
		# Lock start menu, necessary to remove pins, and disable pinning
		@("LockedStartLayout", 0),
		# Disable looking for apps in the store to open files
		@("NoUseStoreOpenWith", 1),
		# Remove pins from start menu
		@("StartLayoutFile", "$Env:SystemRoot\start.xml")
	)),
	@(@("HKLM", "HKCU"), "Software\Policies\Microsoft\Windows\Windows Error Reporting", @(
		# Disable Windows Error Reporting
		@("Disabled", 1),
		$null
	))
)

$entries = $paint3dEntries + $otherEntries
