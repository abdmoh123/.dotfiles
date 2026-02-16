. $PSScriptRoot\Modules\zoxide\setup.ps1
. $PSScriptRoot\Modules\fzf\setup.ps1
. $PSScriptRoot\Modules\fzf\setup_psfzf.ps1
. $PSScriptRoot\Modules\choco\setup.ps1
. $PSScriptRoot\Modules\yazi\setup.ps1
. $PSScriptRoot\Modules\autocomplete\setup.ps1
. $PSScriptRoot\Modules\mise\setup.ps1

. $PSScriptRoot\Aliases\eza.ps1
. $PSScriptRoot\Aliases\zoxide.ps1

# setup starship
Invoke-Expression (&starship init powershell)

$env:POWERSHELL_TELEMETRY_OPTOUT = 1
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

# Automatically start ssh agent for github pushing
# Start-SshAgent -Quiet

