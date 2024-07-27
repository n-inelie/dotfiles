local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font({
	family = "Monaspace Neon",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
-- config.font = wezterm.font({
-- 	family = "Monaspace Argon",
-- 	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
-- })
-- config.font = wezterm.font({
-- 	family = "Monaspace Radon",
-- 	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
-- })
-- config.font = wezterm.font({
-- 	family = "Monaspace Xenon",
-- 	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
-- })
-- config.font = wezterm.font({
-- 	family = "Monaspace Krypton",
-- 	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
-- })
-- config.font = wezterm.font({
-- 	family = "Iosevka Nerd Font",
-- 	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
-- })

config.font_shaper = 'Harfbuzz'

-- config.colors = {
--   foreground = '#d4cfbf',
--   background = '#121212',
--   cursor_bg = '#d4cfbf',
--   cursor_fg = '121212',
--   cursor_border = '#d4cfbf',
--   selection_fg = '#d4cfbf',
--   selection_bg = 'rgba(238, 238, 238, 0.15)',
--   scrollbar_thumb = 'rgba(222, 220, 213, 0.5)',
--   split = '#333333',

--   ansi = {
--     '#393a34',
--     '#cb7676',
--     '#4d9375',
--     '#e6cc77',
--     '#6394bf',
--     '#d9739f',
--     '#5eaab5',
--     '#dbd7ca',
--   },
--   brights = {
--     '#777777',
--     '#cb7676',
--     '#4d9375',
--     '#e6cc77',
--     '#6394bf',
--     '#d9739f',
--     '#5eaab5',
--     '#ffffff',
--   },
-- }

config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.color_scheme = 'Mostly Bright (terminal.sexy)';

-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 100
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	bottom = 0,
}

return config
