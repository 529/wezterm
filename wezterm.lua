local wezterm = require 'wezterm';
local mux = wezterm.mux

config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_dirs = {'~/Library/Fonts/'}
config.font = wezterm.font_with_fallback({
  {family='Cica'},
  {family='Source Han Code JP', weight="Regular", stretch='Normal'},
  'JetBrains Mono',
  'DengXian',
})
config.use_ime = true
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.font_size = 20.0
config.color_scheme = "nord"
config.window_background_opacity = 0.93
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
--config.window_decorations = "RESIZE"

--[[
wezterm.on('gui-startup', function(cmd)
    local tab, top_pane, window = mux.spawn_window(cmd or {})
    print("mux.spawn_window: ", tab, top_pane, window)
    window:gui_window():maximize()
    local bottom_pane = top_pane:split { direction = 'Bottom' }
    local bottom_right_pane = bottom_pane:split { direction = 'Right'}
    top_pane:activate()
    window:spawn_tab { }
end)
]]--

config.disable_default_key_bindings = true
config.leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 2000 }
local keybind = require 'keybinds'
config.keys = keybind.keys
config.key_tables = keybind.key_tables

return config
