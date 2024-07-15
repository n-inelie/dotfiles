local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'Monaspace Neon'

config.color_scheme_dirs = { '$HOME/.config/wezterm/colorschemes' }
config.colors = {
  foreground = '#d4cfbf',
  background = '#121212',
  cursor_bg = '#d4cfbf',
  cursor_fg = '121212',
  cursor_border = '#d4cfbf',
  selection_fg = '#d4cfbf',
  selection_bg = 'rgba(238, 238, 238, 0.15)',
  scrollbar_thumb = 'rgba(222, 220, 213, 0.5)',
  split = '#333333',

  ansi = {
    '#393a34',
    '#cb7676',
    '#4d9375',
    '#e6cc77',
    '#6394bf',
    '#d9739f',
    '#5eaab5',
    '#dbd7ca',
  },
  brights = {
    '#777777',
    '#cb7676',
    '#4d9375',
    '#e6cc77',
    '#6394bf',
    '#d9739f',
    '#5eaab5',
    '#ffffff',
  },
}

return config
