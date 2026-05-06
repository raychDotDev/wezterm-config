local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-nol" },
	})
	table.insert(launch_menu, {
		label = "MSYS UCRT64",
		args = { "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell bash" },
	})
	config.default_prog = { "powershell", "-nol" }
elseif wezterm.target_triple == "x86_64-pc-linux" then
	config.default_prog = { "bash" }
end

config.anti_alias_custom_block_glyphs = false
config.launch_menu = launch_menu

config.text_background_opacity = 0.55
local home = os.getenv("USERPROFILE");
if home == nil then
	home = os.getenv("HOME");
end
-- config.freetype_load_flags = "MONOCHROME"
-- config.freetype_load_target = "Mono"
config.keys = {
}

config.background = {
	{
		source = {
			File = home .. '/.config/wezterm/pics/mine.png'
			-- File = home .. '/.config/wezterm/pics/horse.gif'
		},
		repeat_x = 'NoRepeat',
		width = 'Cover',
		horizontal_align = 'Center',
		height = 'Cover',
		vertical_align = 'Middle',
		hsb = { brightness = 0.7 },
	}
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font_size = 12
config.font = wezterm.font("Monocraft");
config.color_scheme = 'Afterglow'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

config.colors = {
	tab_bar = {
		background = '#0b0b0b00',
		active_tab = {
			bg_color = '#2b2b2b',
			fg_color = '#c0c0c0',
			intensity = 'Bold',
			underline = 'None',
			italic = true,
		},
		inactive_tab = {
			bg_color = '#1b1b1b',
			fg_color = '#808080',
		},
		inactive_tab_hover = {
			bg_color = '#3b3b3b',
			fg_color = '#909090',
			italic = true,
		},
		new_tab = {
			bg_color = '#1b1b1b',
			fg_color = '#808080',
		},
		new_tab_hover = {
			bg_color = '#3b3b3b',
			fg_color = '#909090',
			italic = true,
		},
	},
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
