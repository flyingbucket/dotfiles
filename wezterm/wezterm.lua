local wezterm = require("wezterm")
--
return {
	max_fps = 180,
	-- color_scheme = "GruvboxDarkHard",
	color_scheme = "TD Metal (Archspire)",
	color_schemes = {
		["TD Metal (Archspire)"] = {
			foreground = "#d4d1c8",
			-- background = "#000000",
			background = "#070b12",
			cursor_bg = "#9ad4a8",
			cursor_fg = "#000000",

			selection_bg = "#2a2a2a",
			selection_fg = "#c1c1c1",
			ansi = {
				"#000000", -- 0
				"#63b0b0", -- 1
				"#c3cf88", -- 2
				"#d7e27a", -- 3
				"#6f9bc9", -- 4
				"#b4a6d6", -- 5
				"#8fd0d0", -- 6
				"#d6d6d6", -- 7
			},

			brights = {
				"#555555", -- 8
				"#79c6c6", -- 9
				"#9ad4a8", -- 10
				"#e5f08f", -- 11
				"#90b4e6", -- 12
				"#cbbaf2", -- 13
				"#b2e6e6", -- 14
				"#f2f2f2", -- 15
			},
		},
	},

	cursor_blink_rate = 500,
	cursor_blink_ease_in = "Constant", -- 禁用渐入动画
	cursor_blink_ease_out = "Constant", -- 禁用渐出动画
	default_cursor_style = "BlinkingUnderline", -- 设置光标样式
	enable_tab_bar = true,
	window_decorations = "NONE",
	enable_wayland = false,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 15.0, -- 设置字体大小
	leader = { key = "a", mods = "CTRL" }, -- 设置快捷键
	keys = {
		{
			key = "W",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter workspace name",
				action = wezterm.action_callback(function(window, pane, line)
					if line and #line > 0 then
						window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},
		{
			key = "w",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Set tab title",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "v", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		{ key = "o", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) }, -- 切换到下一个标签页
		{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) }, -- 切换到上一个标签页
		{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	},
}
