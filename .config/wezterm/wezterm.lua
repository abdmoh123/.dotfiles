local wezterm = require("wezterm")
local utils = require("utils")

local config = wezterm.config_builder()

config.max_fps = 120
config.animation_fps = 60

local nushell_cmd = { "nu", "--login" }
local pwsh_cmd = { "pwsh", "-NoLogo" }
local powershell_cmd = { "powershell", "-NoLogo" }
local zsh_cmd = { "zsh", "--login" }

-- [[ OS related stuff ]]
if wezterm.target_triple == "x86_64-pc-windows-msvc" then -- windows specific
	config.win32_system_backdrop = "Acrylic"

	if utils.shell_exists_win("nu") then
		config.default_prog = nushell_cmd
		wezterm.log_info("Using nu shell as default shell")
	elseif utils.shell_exists_win("pwsh") then
		config.default_prog = pwsh_cmd
		wezterm.log_info("Using powershell core as default shell")
	else
		config.default_prog = powershell_cmd
		wezterm.log_info("Using powershell legacy as default shell")
	end
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then -- linux specific
	config.enable_wayland = true

	if utils.shell_exists("nu") then
		config.default_prog = nushell_cmd
		wezterm.log_info("Using nu shell as default shell")
	elseif utils.shell_exists("zsh") then
		config.default_prog = zsh_cmd
		wezterm.log_info("Using zsh as default shell")
	else
		config.default_prog = { "bash", "--login" }
		wezterm.log_info("Using bash as default shell")
	end
end

-- [[ Colour and appearance ]]
local styling = require("styling")
styling.apply_to_config(config)

-- [[ Keysbinds ]]
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
