. $PSScriptRoot\utils.ps1

$env:POWERSHELL_TELEMETRY_OPTOUT = 1
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

if (Command-Exists zoxide)
{
    . $PSScriptRoot\Modules\zoxide\setup.ps1
    . $PSScriptRoot\Aliases\zoxide.ps1
}
if (Command-Exists fzf)
{
    . $PSScriptRoot\Modules\fzf\setup.ps1
    . $PSScriptRoot\Modules\fzf\setup_psfzf.ps1
}
if (Command-Exists choco)
{
    . $PSScriptRoot\Modules\choco\setup.ps1
}
if (Command-Exists yazi)
{
    . $PSScriptRoot\Modules\yazi\setup.ps1
}
if (Command-Exists carapace)
{
    . $PSScriptRoot\Modules\carapace\setup.ps1
}
if (Command-Exists starship)
{
    # setup starship
    Invoke-Expression (&starship init powershell)
}

if (Command-Exists eza)
{
    . $PSScriptRoot\Aliases\eza.ps1
}

# Must do this after all Command-Exists calls (at the end) to prevent MethodInvocationException
if (Command-Exists mise)
{
    . $PSScriptRoot\Modules\mise\setup.ps1
}
