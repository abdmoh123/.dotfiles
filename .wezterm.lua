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

-- [[ Main config ]]

local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.win32_system_backdrop = "Acrylic"
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

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
local maroon = theme_colours.ansi[2] -- "#cc241d"
local green = theme_colours.ansi[3] -- "#98971a"
local olive = theme_colours.ansi[4] -- "#d79921"
local navy = theme_colours.ansi[5] -- "#458588"
local purple = theme_colours.ansi[6] -- "#b16286"
local teal = theme_colours.ansi[7] -- "#689d6a"
local silver = theme_colours.ansi[8] -- "#a89984"

local grey = theme_colours.brights[1]
local red = theme_colours.brights[2]
local lime = theme_colours.brights[3]
local yellow = theme_colours.brights[4]
local blue = theme_colours.brights[5]
local fuschia = theme_colours.brights[6]
local aqua = theme_colours.brights[7]
local white = theme_colours.brights[8] -- "#ebdbb2"

local background = theme_colours.background -- "#282828"
local foreground = theme_colours.foreground -- "#ebdbb2"

local opacity = 1.0
config.window_background_opacity = opacity

-- [[ Tabs ]]
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

-- tab bar icons
local CLOSE_ICON = " " .. wezterm.nerdfonts.cod_chrome_close .. " "
local MAXIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_maximize .. " "
local MINIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_minimize .. " "

local bar_background = navy
local bar_background_hover = aqua
local bar_foreground = lime
local bar_foreground_hover = navy
local active_tab_background = background
local active_tab_foreground = aqua
-- only use white background on active tab if using retro style
if config.use_fancy_tab_bar == false then
	config.tab_bar_style = {
		window_close = wezterm.format({
			{ Text = CLOSE_ICON },
		}),
		window_close_hover = wezterm.format({
			{ Text = CLOSE_ICON },
		}),
		window_maximize = wezterm.format({
			{ Text = MAXIMISE_ICON },
		}),
		window_maximize_hover = wezterm.format({
			{ Text = MAXIMISE_ICON },
		}),
		window_hide = wezterm.format({
			{ Text = MINIMISE_ICON },
		}),
		window_hide_hover = wezterm.format({
			{ Text = MINIMISE_ICON },
		}),
	}
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
			bg_color = bar_background,
			fg_color = bar_foreground,
		},
		inactive_tab_hover = {
			bg_color = bar_background_hover,
			fg_color = bar_foreground_hover,
			intensity = "Bold",
		},
		new_tab = {
			bg_color = bar_background,
			fg_color = bar_foreground,
		},
		new_tab_hover = {
			bg_color = bar_background_hover,
			fg_color = bar_foreground_hover,
		},

		-- fancy style only
		inactive_tab_edge = bar_background,
	},
}

-- [[ Font stuff ]]
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 10.5

-- [[ Padding ]]
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

return config
