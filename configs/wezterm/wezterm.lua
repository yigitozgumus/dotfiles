-- Pull in the wezterm API
local wezterm = require("wezterm")
local wezterm_action = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local function _home_dir()
	return string.format("file://%s", os.getenv("HOME"))
end

local function _current_dir(current_uri)
	local homedir = _home_dir()
	if current_uri:find("^" .. homedir) ~= nil then
		return "~" .. current_uri:sub(#homedir + 1, #current_uri)
	else
		return current_uri:sub(#"file:///", #current_uri)
	end
end

--- ========== Keys ==========
config.keys = {}
table.insert(config.keys, { key = "LeftArrow", mods = "SHIFT|SUPER", action = wezterm_action.ActivateTabRelative(-1) })
table.insert(config.keys, { key = "RightArrow", mods = "SHIFT|SUPER", action = wezterm_action.ActivateTabRelative(1) })

--- ========== Fonts & Themes ==========
local FiraCodeFont = "FiraCode Nerd Font Mono"
local CodeNewRomanFont = "CodeNewRoman Nerd Font"
local MonacoFont = "Monaco Nerd Font Mono"
local NotoSansMonoFont = "NotoSansMono NFM"
local IosevakaFont = "Iosevka Nerd Font Mono"
local HackFont = "Hack Nerd Font Mono"
local FantasqueSansMonoFont = "FantasqueSansMono NFM"
local SauceCodeProFont = "SauceCodePro Nerd Font Mono"

local CatppuccinMochaTheme = "Catppuccin Mocha"
local GruvboxDarkTheme = "Gruvbox Dark (Gogh)"

config.font = wezterm.font(FiraCodeFont)

config.font_size = 15.0
if IS_WINDOWS then
	config.font_size = 14.0
end
if IS_LINUX then
	config.font_size = 11.0
end
config.colors = {
	scrollbar_thumb = "black",
}

-- This is where you actually apply your config choices
config.color_scheme = CatppuccinMochaTheme

--- ========== Tabs ==========
config.use_fancy_tab_bar = true
config.tab_max_width = 256
config.window_frame = {
	font = wezterm.font(FiraCodeFont),
	font_size = 13,
}
config.scrollback_lines = 200000
config.enable_scroll_bar = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_decorations = "RESIZE"

local function get_process(tab)
	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if string.find(process_name, "kubectl") then
		process_name = "kubectl"
	end
	return wezterm.format({ { Text = string.format("[%s]", process_name) } })
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local function _get_cwd(tab)
		return _current_dir(tab.active_pane.current_working_dir)
	end

	local title = string.format(" %s %s ", get_process(tab), _get_cwd(tab))
	return {
		{ Text = title },
	}
end)

--- ========== CWD ==========
config.default_cwd = wezterm.home_dir

-- For example, changing the color scheme:
config.window_background_opacity = 0.95

-- and finally, return the configuration to wezterm
return config
