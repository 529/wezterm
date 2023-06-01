local wezterm = require 'wezterm';
local mux = wezterm.mux

config = {}

config.font_dirs = {'~/Library/Fonts/'}
config.font = wezterm.font_with_fallback({
    {family='Source Han Code JP', weight="Regular", stretch='Normal'},
    'JetBrains Mono',
    'Fira Code',
    'DengXian',
})
config.use_ime = true
config.font_size = 18.0
config.color_scheme = "nord"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = fals

wezterm.on('gui-startup', function(cmd)
    local tab, top_pane, window = mux.spawn_window(cmd or {})
    print("mux.spawn_window: ", tab, top_pane, window)
    window:gui_window():maximize()
    local bottom_pane = top_pane:split { direction = 'Bottom' }
    local bottom_right_pane = bottom_pane:split { direction = 'Right'}
    top_pane:activate()
    window:spawn_tab { }
end)

return config
