local wezterm = require 'wezterm';
-- local mux = wezterm.mux

local config = {}

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
config.font_size = 22.0
config.audible_bell = 'Disabled'
config.color_scheme = "nord"
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false


----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
-- config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = true
-- falseにするとタブバーの透過が効かなくなる
-- config.use_fancy_tab_bar = false

-- タブバーの透過
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
   colors = { "#000000" },
}

-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false

-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

--local icon = wezterm.nerdfonts.cod_verified

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#32cdcd"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)



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
