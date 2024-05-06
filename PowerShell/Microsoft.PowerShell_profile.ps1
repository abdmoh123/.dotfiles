# Automatically enable posh-git (auto complete)
Import-Module posh-git

# Automatically start ssh agent for github pushing
# Start-SshAgent -Quiet

# Enable zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# FZF config
# Enable fd integration
$env:FZF_DEFAULT_COMMAND='fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git'
$env:FZF_CTRL_T_COMMAND=$env:FZF_DEFAULT_COMMAND
$env:FZF_ALT_C_COMMAND='fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git'
# Use bat to show file preview
$env:FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
$env:FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {}'"
# Set fzf theme
Import-Module $PSScriptRoot\Modules\fzf\theme.ps1
$env:FZF_DEFAULT_OPTS=$env:FZF_DEFAULT_THEME
# PSFzf config
# Enable keybinds
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# Override cd command (use zoxide instead)
$commandOverride = [ScriptBlock]{ param($Location) $Location }
Set-PsFzfOption -AltCCommand $commandOverride

# Import aliases
Import-Module $PSScriptRoot\Aliases\zoxide.ps1
Import-Module $PSScriptRoot\Aliases\eza.ps1

