local wezterm = require("wezterm")

local module = {}

local function format_mode_text(mode_text)
	-- replace underscores with spaces
	local new_string = string.gsub(mode_text, "_+", " ")

	-- capitalise all letters
	new_string = string.upper(new_string)

	-- remove 'MODE' from the end of the string
	if string.sub(new_string, -5) == " MODE" then
		new_string = string.sub(new_string, 1, -6)
	end

	return new_string
end

function module.apply_to_config(config)
	-- window title bar buttons
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

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

	-- desaturate and dim inactive panes
	config.inactive_pane_hsb = {
		saturation = 0.75,
		brightness = 0.5,
	}

	local theme_name = "Gruvbox Material (Gogh)"
	config.color_scheme = theme_name
	config.window_background_opacity = 1.0

	-- [[ Get theme's colours as variables ]]
	-- WARNING: Some themes may not have ANSI colours
	local theme_colours = wezterm.color.get_builtin_schemes()[theme_name]
	local transparent = "rgba(0,0,0,0)"
	local black = theme_colours.ansi[1]
	local maroon = theme_colours.ansi[2]
	local green = theme_colours.ansi[3]
	local olive = theme_colours.ansi[4] -- dark yellow
	local navy = theme_colours.ansi[5]
	local purple = theme_colours.ansi[6]
	local teal = theme_colours.ansi[7]
	local silver = theme_colours.ansi[8]
	local grey = theme_colours.brights[1]
	local red = theme_colours.brights[2]
	local lime = theme_colours.brights[3]
	local yellow = theme_colours.brights[4]
	local blue = theme_colours.brights[5]
	local fuschia = theme_colours.brights[6]
	local aqua = theme_colours.brights[7]
	local white = theme_colours.brights[8]
	local background = theme_colours.background
	local foreground = theme_colours.foreground

	-- [[ Tabs ]]
	config.enable_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = false -- always show tab bar
	config.use_fancy_tab_bar = false -- use retro bar instead
	config.status_update_interval = 1000 -- set update interval to 1s

	-- set tab bar icons
	local CLOSE_ICON = " " .. wezterm.nerdfonts.cod_chrome_close .. " "
	local MAXIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_maximize .. " "
	local MINIMISE_ICON = " " .. wezterm.nerdfonts.cod_chrome_minimize .. " "

	-- styling for retro tab bar only
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

	-- set tab bar colours
	local bar_background = grey
	local bar_foreground = silver
	local bar_foreground_hover = black
	local tab_background_hover = yellow
	local bar_background_hover = silver
	local active_tab_background = background
	local active_tab_foreground = yellow
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
				bg_color = tab_background_hover,
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

	wezterm.on("update-status", function(window, pane)
		-- local cwd = pane:get_current_working_dir()
		-- local cwd_short = cwd:gsub(os.getenv("HOME"), "~")

		local mode
		local mode_bg_colour
		local mode_fg_colour = grey
		if window:active_key_table() then
			mode = format_mode_text(window:active_key_table())
			if mode == "COPY" then
				mode_bg_colour = red
			elseif mode == "SEARCH" then
				mode_bg_colour = aqua
			elseif mode == "TAB" then
				mode_bg_colour = yellow
			elseif mode == "PANE" then
				mode_bg_colour = purple
			else
				-- fallback
				mode_bg_colour = blue
			end
		elseif window:leader_is_active() then
			mode = "LEADER"
			mode_bg_colour = blue
		else
			mode = "NORMAL"
			mode_bg_colour = green
		end

		-- left status (mode)
		window:set_left_status(wezterm.format({
			{ Background = { Color = mode_bg_colour } },
			{ Foreground = { Color = mode_fg_colour } },
			{ Attribute = { Intensity = "Bold" } },
			{ Text = " " },
			{ Text = mode },
			{ Text = " " },
			"ResetAttributes",
		}))
	end)
end

return module
