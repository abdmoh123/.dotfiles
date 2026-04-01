# PSFzf config
# Enable keybinds
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Override cd command (use zoxide instead)
$commandOverride = [ScriptBlock]{ param($Location) z $Location }
Set-PsFzfOption -AltCCommand $commandOverride
