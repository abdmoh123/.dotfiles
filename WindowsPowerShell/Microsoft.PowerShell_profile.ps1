# Automatically enable posh-git (auto complete)
Import-Module posh-git

# Automatically start ssh agent for github pushing
# Start-SshAgent -Quiet

# Enable zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
