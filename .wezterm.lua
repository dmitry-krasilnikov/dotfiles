local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Catppuccin Latte'
config.colors = require('lua/colorschemes/rose-pine-dawn').colors()

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.font = wezterm.font 'Hack Nerd Font'

return config
