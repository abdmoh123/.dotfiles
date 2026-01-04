local wezterm = require("wezterm")
---@type Utils
local utils = require("utils")

local config = wezterm.config_builder()

config.max_fps = 120
config.animation_fps = 60

-- [[ Shell related settings ]]
local shell_cmd = utils.get_default_shell()
config.default_prog = shell_cmd
-- wezterm.log_info("Using shell (+ args): " .. table.concat(shell_cmd, " "))

-- [[ OS specific settings ]]
local os_type = utils.get_os()
if os_type == utils.OSTypes.Windows then
	config.win32_system_backdrop = "Acrylic"
elseif os_type == utils.OSTypes.Linux then
	config.enable_wayland = true
end

-- [[ Colour and appearance ]]
local styling = require("styling")
styling.apply_to_config(config)

-- [[ Keybinds ]]
local keybinds = require("keybinds")
keybinds.apply_to_config(config)

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config, {
	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "ALT", -- modifier to use for pane movement, e.g. ALT+h to move left
		resize = "ALT|SHIFT", -- modifier to use for pane resize, e.g. ALT+SHIFT+h to resize to the left
	},
	-- log level to use: info, warn, error
	log_level = "info",
})

return config
