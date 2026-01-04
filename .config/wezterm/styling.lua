local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- window title bar buttons
	config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
	local os_type = utils.get_os()
	if os_type == utils.OSTypes.Linux then
		config.window_decorations = "TITLE|RESIZE" -- until the wayland integrated titlebar bug is fixed
	else
		config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	end

	-- [[ Font stuff ]]
	config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font_size = 10.5

	-- desaturate and dim inactive panes
	config.inactive_pane_hsb = {
		saturation = 0.75,
		brightness = 0.85,
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

	-- [[ Padding ]]
	local padding_val = 1.0
	local conv_to_cell = function(val)
		return val .. "cell"
	end
	config.window_padding = {
		left = 0,
		right = 0,
		top = conv_to_cell(padding_val / 2.0),
		bottom = 0,
	}
	config.window_frame = {
		border_top_height = conv_to_cell(padding_val / 2.0),
		border_bottom_height = conv_to_cell(padding_val / 2.0),
		border_left_width = conv_to_cell(padding_val),
		border_right_width = conv_to_cell(padding_val),
		border_top_color = background,
		border_bottom_color = background,
		border_left_color = background,
		border_right_color = background,
	}

	-- styling for retro tab bar only
	if config.use_fancy_tab_bar == false then
		config.tab_bar_style = {
			window_close = wezterm.format({
				{ Text = CLOSE_ICON .. " " },
			}),
			window_close_hover = wezterm.format({
				{ Text = CLOSE_ICON .. " " },
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
	local bar_background = background
	local bar_foreground = silver
	local bar_foreground_hover = black
	local tab_background = black
	local tab_background_hover = yellow
	local bar_background_hover = silver
	local active_tab_background = yellow
	local active_tab_foreground = black
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
				bg_color = tab_background,
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
		-- [[ Left section ]]
		-- format the text to be displayed in mode status block (all caps with no underscores)
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

		local mode
		local mode_bg_colour
		local mode_fg_colour = background
		if window:active_key_table() then
			mode = format_mode_text(window:active_key_table())
			if mode == "COPY" then
				mode = wezterm.nerdfonts.md_content_copy .. " " .. mode
				mode_bg_colour = red
			elseif mode == "SEARCH" then
				mode = wezterm.nerdfonts.fa_search .. " " .. mode
				mode_bg_colour = aqua
			elseif mode == "TAB" then
				mode = wezterm.nerdfonts.md_tab .. " " .. mode
				mode_bg_colour = yellow
			elseif mode == "PANE" then
				mode = wezterm.nerdfonts.fa_square_o .. " " .. mode
				mode_bg_colour = purple
			else
				-- fallback
				mode = wezterm.nerdfonts.fa_question_circle_o .. " " .. mode
				mode_bg_colour = blue
			end
		elseif window:leader_is_active() then
			mode = wezterm.nerdfonts.fa_dot_circle_o .. " LEADER"
			mode_bg_colour = blue
		else
			mode = wezterm.nerdfonts.fa_circle_o .. " NORMAL"
			mode_bg_colour = bar_background_hover
		end

		window:set_left_status(wezterm.format({
			{ Background = { Color = mode_fg_colour } },
			{ Foreground = { Color = mode_bg_colour } },
			{ Text = " " },
			{ Background = { Color = mode_bg_colour } },
			{ Foreground = { Color = mode_fg_colour } },
			{ Attribute = { Intensity = "Bold" } },
			{ Text = mode },
			{ Background = { Color = mode_fg_colour } },
			{ Foreground = { Color = mode_bg_colour } },
			{ Text = " " },
			"ResetAttributes",
		}))

		-- [[ Right section ]]
		local workspace_name = window:active_workspace()

		-- only gets the leaf of the directory tree (e.g. /home/user/Documents -> Documents)
		local basename = function(s)
			return string.gsub(s, "(.*[/\\])(.*)", "%2")
		end

		local current_cmd = pane:get_foreground_process_name()
		-- current command could be nil if none are being run (e.g. when in debug mode through CTRL+SHIFT+L)
		current_cmd = current_cmd and basename(current_cmd) or " "
		if current_cmd ~= " " then
			-- add icon, border and spacing to the text
			current_cmd = wezterm.nerdfonts.oct_command_palette .. " " .. current_cmd
		end

		window:set_right_status(wezterm.format({
			{ Text = current_cmd .. " │ " },
			{ Text = wezterm.nerdfonts.md_view_dashboard .. " " .. workspace_name .. " " },
		}))
	end)

	-- increase tab max width so it's easier to read
	config.tab_max_width = 32
	wezterm.on("format-tab-title", function(tab, _, panes, _, hover, max_width)
		local function format_tab_title(tab_in)
			local title = tab_in.tab_title
			-- return manually renamed tab title if it exists
			if title and #title > 0 then
				return wezterm.truncate_right(title, max_width - 6)
			end

			title = tab_in.active_pane.title .. "\\"
			-- get only the current directory name (+ running command)
			local split_str = {}
			for str in title:gmatch("(.-)\\") do
				table.insert(split_str, str)
			end
			local dir_name = split_str[#split_str] -- get final element

			-- truncate the folder name if required
			return wezterm.truncate_right(dir_name, max_width - 6)
		end

		local tab_title = format_tab_title(tab)
		local tab_num_background = bar_foreground
		local tab_num_foreground = tab_background
		local tab_text_intensity = "Normal"
		local border_right_foreground = tab_background

		if tab.is_active then
			tab_num_background = active_tab_background
			tab_num_foreground = active_tab_foreground
			border_right_foreground = active_tab_background
		end
		if hover then
			tab_num_background = tab_background_hover
			border_right_foreground = active_tab_background
			tab_text_intensity = "Bold"
		end

		return {
			{ Background = { Color = background } },
			{ Foreground = { Color = tab_num_background } },
			{ Text = "" },
			{ Background = { Color = tab_num_background } },
			{ Foreground = { Color = tab_num_foreground } },
			{ Attribute = { Intensity = tab_text_intensity } },
			{ Text = (tab.tab_index + 1) .. "▕" },
			"ResetAttributes",
			{ Attribute = { Intensity = tab_text_intensity } },
			{ Text = " " .. tab_title },
			{ Background = { Color = background } },
			{ Foreground = { Color = border_right_foreground } },
			{ Text = " " },
		}
	end)
end

return module
