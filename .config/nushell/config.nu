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

# setup yazi to allow cwd to change (yy alias)
def --env yy [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# setup starship
use ~/.cache/starship/init.nu

# rm command moves to trash by default
$env.rm_always_trash = true

# disable dotnet telemetry
$env.DOTNET_CLI_TELEMETRY_OPTOUT = true

# setup zoxide
source ~/.zoxide.nu

# add fzf config (keybinds + theming)
source ./fzf.nu

# add bat configs (theme)
source ./bat.nu

# aliases
source ./aliases.nu
