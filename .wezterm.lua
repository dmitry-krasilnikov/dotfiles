local wezterm = require 'wezterm'
local config = {}

config.colors = require('lua/colorschemes/rose-pine-dawn').colors()

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}
config.font = wezterm.font 'Hack Nerd Font'

return config
