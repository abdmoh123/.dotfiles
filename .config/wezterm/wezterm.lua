local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.max_fps = 120
config.animation_fps = 60

-- [[ Windows related stuff ]]
config.win32_system_backdrop = "Acrylic"
config.default_prog = { "pwsh", "-NoLogo" }

-- [[ Colour and appearance ]]
local styling = require("styling")
styling.apply_to_config(config)

-- [[ Keysbinds ]]
local keybinds = require("keybinds")
keybinds.apply_to_config(config)

return config
