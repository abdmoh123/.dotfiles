. $PSScriptRoot\utils.ps1

$env:POWERSHELL_TELEMETRY_OPTOUT = 1
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

if (Command-Exists zoxide)
{
    . $PSScriptRoot\Configs\zoxide\setup.ps1
    . $PSScriptRoot\Aliases\zoxide.ps1
}
if (Command-Exists fzf)
{
    . $PSScriptRoot\Configs\fzf\setup.ps1
    . $PSScriptRoot\Configs\fzf\setup_psfzf.ps1
}
if (Command-Exists choco)
{
    . $PSScriptRoot\Configs\choco\setup.ps1
}
if (Command-Exists yazi)
{
    . $PSScriptRoot\Configs\yazi\setup.ps1
}
if (Command-Exists carapace)
{
    . $PSScriptRoot\Configs\carapace\setup.ps1
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
    . $PSScriptRoot\Configs\mise\setup.ps1
}
