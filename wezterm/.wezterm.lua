
local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
config.font_size = 11.0
config.color_scheme = "Campbell"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.95

return config
