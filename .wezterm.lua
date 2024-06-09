-- [[ Helper functions ]]
local convertToHex = function(num)
	-- [[ Convert an alpha float (0-1) into a hex representation (00-FF) ]]

	-- limit output to be between 00 and FF
	if num > 1.0 then
		return "FF"
	end
	if num < 0.0 then
		return "00"
	end

	-- convert 0.0-1.0 float to 0-255 integer
	local rounded_num = math.floor((num * 255) + 0.5)

	local HEX_VALUES = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" }

	-- calculate the hex representation of the given num
	local hex_result = ""
	while rounded_num > 15 do
		local remainder = math.fmod(rounded_num, 16)
		rounded_num = math.floor(rounded_num / 16)
		hex_result = HEX_VALUES[remainder + 1] .. hex_result
	end
	hex_result = HEX_VALUES[rounded_num + 1] .. hex_result

	-- ensure result is 2 chars long
	if string.len(hex_result) < 2 then
		hex_result = "0" .. hex_result
	end

	return hex_result
end

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.win32_system_backdrop = "Acrylic"
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

config.max_fps = 120
config.animation_fps = 60

-- [[ Default shell ]]
config.default_prog = { "pwsh", "-NoLogo" }

-- [[ Colour and appearance ]]
local theme_name = "Gruvbox Dark (Gogh)"
config.color_scheme = theme_name

-- get theme's colours as variables
local theme_colours = wezterm.color.get_builtin_schemes()[theme_name]
local transparent = "rgba(0,0,0,0)"
local black = theme_colours.ansi[1] -- "#282828"
local red = theme_colours.ansi[2] -- "#cc241d"
local green = theme_colours.ansi[3] -- "#98971a"
local yellow = theme_colours.ansi[4] -- "#d79921"
local blue = theme_colours.ansi[5] -- "#458588"
local magenta = theme_colours.ansi[6] -- "#b16286"
local aqua = theme_colours.ansi[7] -- "#689d6a"
local grey = theme_colours.ansi[8] -- "#a89984"
local white = theme_colours.brights[8] -- "#ebdbb2"

local background = theme_colours.background -- "#282828"
local foreground = theme_colours.foreground -- "#ebdbb2"

local opacity = 1.0
config.window_background_opacity = opacity

-- [[ Tabs ]]
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

local bar_background = transparent
local active_tab_background = black
local active_tab_foreground = white
-- only use white background on active tab if using retro style
if config.use_fancy_tab_bar == false then
	bar_background = background
	active_tab_background = white
	active_tab_foreground = black
end

-- tab style (both retro and fancy style)
config.colors = {
	tab_bar = {
		background = bar_background,
		active_tab = {
			bg_color = active_tab_background,
			fg_color = active_tab_foreground,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = background,
			fg_color = grey,
		},
		inactive_tab_hover = {
			bg_color = background,
			fg_color = grey,
			intensity = "Bold",
		},
		new_tab = {
			bg_color = bar_background,
			fg_color = foreground,
		},

		-- fancy style only
		inactive_tab_edge = grey,
	},
}

return config
