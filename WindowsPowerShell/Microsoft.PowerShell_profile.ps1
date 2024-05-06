# Automatically enable posh-git (auto complete)
Import-Module posh-git

# Automatically start ssh agent for github pushing
# Start-SshAgent -Quiet

# Enable zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

