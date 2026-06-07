local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.force_reverse_video_cursor = true;
config.colors = {
};
local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-nol" },
	})
	config.default_prog = { "powershell", "-nol" }
elseif wezterm.target_triple == "x86_64-pc-linux" then
	config.default_prog = { "bash" }
end

config.anti_alias_custom_block_glyphs = false
config.launch_menu = launch_menu

local home = os.getenv("USERPROFILE");
if home == nil then
	home = os.getenv("HOME");
end
config.keys = {
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font_size = 12
config.font = wezterm.font("DepartureMono Nerd Font Mono", { weight = "Regular" });
-- config.color_scheme = 'Afterglow'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

config.colors = {

	foreground = "#c5c9c5",
	background = "#181616",

	cursor_bg = "#C8C093",
	cursor_fg = "#C8C093",
	cursor_border = "#C8C093",

	selection_fg = "#C8C093",
	selection_bg = "#2D4F67",

	scrollbar_thumb = "#16161D",
	split = "#16161D",

	ansi = {
		"#0D0C0C",
		"#C4746E",
		"#8A9A7B",
		"#C4B28A",
		"#8BA4B0",
		"#A292A3",
		"#8EA4A2",
		"#C8C093",
	},
	brights = {
		"#A6A69C",
		"#E46876",
		"#87A987",
		"#E6C384",
		"#7FB4CA",
		"#938AA9",
		"#7AA89F",
		"#C5C9C5",
	},
	tab_bar = {

		foreground = "#c5c9c5",
		background = "#181616",
		active_tab = {
			bg_color = '#c5c9c5',
			fg_color = '#181616',
			intensity = 'Bold',
			italic = true,
		},
		inactive_tab = {
			fg_color = '#c5c9c5',
			bg_color = '#181616',
		},
	},
}
config.text_background_opacity = 0.65
config.background = {
	{
		source = {
			File = home .. '/.config/wezterm/pics/dunno.png'
			-- File = home .. '/.config/wezterm/pics/horse.gif'
		},
		repeat_x = 'NoRepeat',
		width = 'Cover',
		horizontal_align = 'Center',
		height = 'Cover',
		vertical_align = 'Middle',
		hsb = { brightness = 0.01 },
	}
}
config.window_close_confirmation = 'NeverPrompt'
table.insert(
	config.keys,
	{
		key = 'w',
		mods = 'SHIFT|CTRL',
		action = wezterm.action.CloseCurrentTab { confirm = false },
	}
)
table.insert(
	config.keys,
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action { SpawnTab = "CurrentPaneDomain" },
	}
)


wezterm.on('mux-is-process-stateful', function()
	return false
end)

return config
