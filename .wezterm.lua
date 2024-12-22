local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

config.max_fps = 120
config.animation_fps = 60

-- [[ Windows related stuff ]]
config.win32_system_backdrop = "Acrylic"
config.default_prog = { "pwsh", "-NoLogo" }

-- [[ Colour and appearance ]]
local theme_name = "Gruvbox Material (Gogh)"
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
config.status_update_interval = 1000 -- speed up update

-- tab bar icons
local CLOSE_ICON = " " .. wezterm.nerdfonts.cod_chrome_close .. " "
local MAXIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_maximize .. " "
local MINIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_minimize .. " "

local bar_background = grey
local bar_background_hover = yellow
local bar_foreground = silver
local bar_foreground_hover = black
local active_tab_background = background
local active_tab_foreground = yellow
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

-- [[ Keys ]]
local act = wezterm.action

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- leader key passthrough
	{ key = " ", mods = "CTRL", action = act.SendKey({ key = " ", mods = "CTRL" }) },

	-- copy mode
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	-- search/find mode
	{ key = "/", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },

	-- tab navigation
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "Tab", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "LEADER|SHIFT", action = act.ActivateTabRelative(-1) },
	-- tab creation and deletion
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	-- tabs closes when only 1 pane
	{ key = "d", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

	-- split panes horizontally or vertically
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- to right
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- to bottom
	-- moving around panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- key tables
	{ key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "pane_mode", one_shot = false }) },
	{ key = "t", mods = "LEADER", action = act.ActivateKeyTable({ name = "tab_mode", one_shot = false }) },

	-- selecting workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

-- select tab by number/index position
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end
-- bind tab 0 to tab 10
table.insert(config.keys, {
	key = "0",
	mods = "LEADER",
	action = act.ActivateTab(9),
})
table.insert(config.keys, {
	key = "0",
	mods = "CTRL",
	action = act.ActivateTab(9),
})

config.key_tables = {
	pane_mode = {
		-- split panes horizontally or vertically
		{ key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- to right
		{ key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- to bottom
		-- close current pane
		{ key = "x", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "d", action = act.CloseCurrentPane({ confirm = true }) },
		-- rotate panes
		{ key = "r", action = act.RotatePanes("Clockwise") },

		-- moving around panes
		{ key = "h", action = act.ActivatePaneDirection("Left") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		-- resizing panes
		{ key = "h", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },

		-- allows exit from pane mode
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	tab_mode = {
		-- open tab navigator
		{ key = "t", action = act.ShowTabNavigator },

		-- create new tab
		{ key = "n", action = act.SpawnTab("CurrentPaneDomain") },
		-- close current tab
		{ key = "x", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "d", action = act.CloseCurrentTab({ confirm = true }) },

		-- moving around panes
		{ key = "h", action = act.ActivateTabRelative(-1) },
		{ key = "l", action = act.ActivateTabRelative(1) },

		-- moving tabs left and right
		{ key = "<", action = act.MoveTabRelative(-1) },
		{ key = ">", action = act.MoveTabRelative(1) },

		-- make pane fullscreen
		{ key = "f", action = act.TogglePaneZoomState },

		-- allows exit from tab mode
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

return config
