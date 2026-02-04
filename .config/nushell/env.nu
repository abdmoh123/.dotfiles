# env.nu
#
# Installed by:
# version = "0.101.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# set default editor to neovim
$env.config.buffer_editor = "nvim"

# carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# zoxide
zoxide init nushell | save -f ~/.zoxide.nu

# fix bug with wezterm windows scrolling up with every key press
$env.config.shell_integration.osc133 = false

# rm command moves to trash by default
$env.rm_always_trash = true

# starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# api keys
const API_SECRETS_DIR = "~/.dotfiles/secrets/ai-api-keys"
const CLAUDE_API_KEY_PATH = $API_SECRETS_DIR | path join 'claude.env'
$env.ANTHROPIC_API_KEY = if (echo $CLAUDE_API_KEY_PATH | path exists) {
	$CLAUDE_API_KEY_PATH | open | str trim
} else { '' }
$env.AVANTE_ANTHROPIC_API_KEY = $env.ANTHROPIC_API_KEY

const GEMINI_API_KEY_PATH = $API_SECRETS_DIR | path join 'gemini.env'
$env.GEMINI_API_KEY = if (echo $GEMINI_API_KEY_PATH | path exists) {
	$GEMINI_API_KEY_PATH | open | str trim
} else { '' }
$env.AVANTE_GEMINI_API_KEY = $env.GEMINI_API_KEY

# create generated alias file
source $"($nu.default-config-dir)/alias-generator.nu"

# activate mise for completions
let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force
