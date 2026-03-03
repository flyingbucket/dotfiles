local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- maximize the window on startup
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- color scheme settings
local colors = require("colors.metals")
config.color_scheme = "TD Metal (Archspire)"
config.color_schemes = colors.schemes

-- other settings
config.max_fps = 180
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingUnderline"
config.enable_tab_bar = true
config.window_decorations = "NONE"
config.enable_wayland = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

-- key bindings
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{
		key = "W",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Create workspace:Enter workspace name",
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
}

return config
