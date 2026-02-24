-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Shell default: MSYS2 Environment
-- config.default_prog = { "C:\\msys64\\usr\\bin\\zsh.exe", "-l" }

-- config.default_domain = "WSL:Ubuntu"
config.default_domain = "WSL:archlinux"

-- or, changing the font size and color scheme.
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13
config.adjust_window_size_when_changing_font_size = false
config.color_scheme = "tokyonight_moon"

-- turn off ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- window settings
config.window_padding = {
	top = "12px",
	left = "5px",
	right = "5px",
	bottom = "0px",
}

-- tab bar
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

-- disable missing glyphs
config.warn_about_missing_glyphs = false

-- custom colors
config.colors = {
	split = "#7aa2f7",
	cursor_bg = "#c0caf5",
	cursor_border = "#c0caf5",
	tab_bar = {
		-- The color of the strip that goes along the <tab_bar_at_bottom value> of the window
		background = "#16161e",

		active_tab = {
			bg_color = "#7aa2f7",
			fg_color = "#16161e",
		},

		inactive_tab = {
			bg_color = "#3b4261",
			fg_color = "#7aa2f7",
		},

		inactive_tab_hover = {
			bg_color = "#596391",
			fg_color = "#7aa2f7",
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1F2333",
			fg_color = "#a9b1d6",
		},
		new_tab_hover = { bg_color = "#323852", fg_color = "#a9b1d6" },
	},
}

-- Opacity & Background blur
-- config.window_background_opacity = 0.65
-- config.win32_system_backdrop = "Acrylic" -- for windows os
-- config.win32_acrylic_accent_color = "#1e1e2e" -- for windows os

-- tmux like keybinds
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = [[\]],
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "h",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "l",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "j",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "k",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},

	{ mods = "LEADER", key = "b", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },

	{ mods = "LEADER", key = "1", action = wezterm.action.ActivatePaneByIndex(0) },
	{ mods = "LEADER", key = "2", action = wezterm.action.ActivatePaneByIndex(1) },
	{ mods = "LEADER", key = "3", action = wezterm.action.ActivatePaneByIndex(2) },
	{ mods = "LEADER", key = "4", action = wezterm.action.ActivatePaneByIndex(3) },
	{ mods = "LEADER", key = "5", action = wezterm.action.ActivatePaneByIndex(4) },
	{ mods = "LEADER", key = "6", action = wezterm.action.ActivatePaneByIndex(5) },
	{ mods = "LEADER", key = "7", action = wezterm.action.ActivatePaneByIndex(6) },
	{ mods = "LEADER", key = "8", action = wezterm.action.ActivatePaneByIndex(7) },
	{ mods = "LEADER", key = "9", action = wezterm.action.ActivatePaneByIndex(8) },
	-- Scroll keybind
	{
		key = "UpArrow",
		mods = "SHIFT",
		action = wezterm.action.ScrollByLine(-1),
	},
	{
		key = "DownArrow",
		mods = "SHIFT",
		action = wezterm.action.ScrollByLine(1),
	},
}

-- Mouse events
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- command palette style
config.command_palette_font = wezterm.font("FiraCode Nerd Font Mono")
config.command_palette_rows = 15

return config
