-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ##### COMMON SETTINGS #####

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

-- ##### OPERATING SYSTEM SPECIFIC SETTINGS #####

-- MacOS
if wezterm.target_triple == "aarch64-apple-darwin" then
	config.window_decorations = "TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
	config.window_background_opacity = 0.85
	config.font_size = 14.0

-- Windows
elseif wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe" } -- PowerShell 7+
	config.window_background_opacity = 0.9
	config.font_size = 12.0

-- Linux
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.font_size = 12.0
	config.window_background_opacity = 0.85
end

-- and finally, return the configuration to wezterm
return config
