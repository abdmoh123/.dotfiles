# FZF config
# Enable fd integration
$env:FZF_DEFAULT_COMMAND='fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git'
$env:FZF_CTRL_T_COMMAND=$env:FZF_DEFAULT_COMMAND
$env:FZF_ALT_C_COMMAND='fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git'
# Use bat to show file preview
$env:FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
$env:FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {}'"

Import-Module $PSScriptRoot\theme.ps1

# PSFzf config
# Enable keybinds
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Override cd command (use zoxide instead)
$commandOverride = [ScriptBlock]{ param($Location) z $Location }
Set-PsFzfOption -AltCCommand $commandOverride

