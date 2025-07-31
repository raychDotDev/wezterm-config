local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { "pwsh", "--nologo" }

config.font = wezterm.font('CaskaydiaMono Nerd Font')

config.text_background_opacity = 0.85
local home = os.getenv("HOME");
if home == nil then
	home = os.getenv("USERPROFILE");
end

config.background = {
	{
		source = {
			File = home .. '\\.config\\wezterm\\pics\\0.jpg'
		},
		repeat_x = 'NoRepeat',
		width = 'Cover',
		horizontal_align = 'Center',
		height= 'Cover',
		vertical_align = 'Middle',
		hsb = { brightness = 0.02 },
	}
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 10
config.color_scheme = 'Afterglow'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.colors = {
  tab_bar = {
    background = '#0b0b0b',
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

return config
