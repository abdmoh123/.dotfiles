local wezterm = require("wezterm")

local act = wezterm.action

local module = {}

function module.apply_to_config(config)
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
end

return module
