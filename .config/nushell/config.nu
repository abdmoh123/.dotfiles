# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# stop showing the banner
$env.config.show_banner = false

# vi mode stuff
$env.config.edit_mode = 'vi'
$env.PROMPT_INDICATOR_VI_NORMAL = '󰝤 '
$env.PROMPT_INDICATOR_VI_INSERT = '󱗼 '

# setup carapace auto-complete
source ~/.cache/carapace/init.nu

# setup starship
use ~/.cache/starship/init.nu

# disable dotnet telemetry
$env.DOTNET_CLI_TELEMETRY_OPTOUT = true

# setup zoxide
source ~/.zoxide.nu

# setup yazi
source ./yazi.nu

# setup fast node manager (fnm)
source ./fnm.nu

# add fzf config (keybinds + theming)
source ./fzf.nu

# add bat configs (theme)
source ./bat.nu

# aliases
source ./aliases.nu
