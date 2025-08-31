-- WezTerm Configuration
-- Professional configuration with modern features and productivity enhancements

local wezterm = require 'wezterm'
local act = wezterm.action

-- Helper function to get OS
local function get_os()
  return wezterm.target_triple:match("([^-]+)-")
end

-- Helper function to get home directory
local function get_home()
  return os.getenv("HOME")
end

-- Configuration
local config = {}

-- General appearance
config.color_scheme = "Catppuccin Mocha" -- Popular dark theme
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Fira Code",
  "SF Mono",
  "Monaco",
  "Menlo",
  "Consolas",
  "Liberation Mono",
  "DejaVu Sans Mono",
  "Bitstream Vera Sans Mono",
  "Courier New",
  "monospace",
})

config.font_size = 14.0
config.line_height = 1.2
config.cell_width = 0.9

-- Window appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = true
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = true

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colors and styling
config.colors = {
  -- Override some colors from the Catppuccin theme
  cursor_bg = "#f5c2e7",
  cursor_border = "#f5c2e7",
  cursor_fg = "#1e1e2e",
  selection_bg = "#575268",
  selection_fg = "#d9e0ee",
  
  -- Tab bar colors
  tab_bar = {
    background = "#1e1e2e",
    active_tab = {
      bg_color = "#89b4fa",
      fg_color = "#1e1e2e",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
    },
    inactive_tab_hover = {
      bg_color = "#45475a",
      fg_color = "#cdd6f4",
    },
    new_tab = {
      bg_color = "#1e1e2e",
      fg_color = "#cdd6f4",
    },
    new_tab_hover = {
      bg_color = "#313244",
      fg_color = "#cdd6f4",
    },
  },
}

-- Key bindings
config.keys = {
  -- Copy and paste
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
  
  -- Tab management
  { key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "1", mods = "CTRL", action = act.ActivateTab(0) },
  { key = "2", mods = "CTRL", action = act.ActivateTab(1) },
  { key = "3", mods = "CTRL", action = act.ActivateTab(2) },
  { key = "4", mods = "CTRL", action = act.ActivateTab(3) },
  { key = "5", mods = "CTRL", action = act.ActivateTab(4) },
  { key = "6", mods = "CTRL", action = act.ActivateTab(5) },
  { key = "7", mods = "CTRL", action = act.ActivateTab(6) },
  { key = "8", mods = "CTRL", action = act.ActivateTab(7) },
  { key = "9", mods = "CTRL", action = act.ActivateTab(8) },
  { key = "0", mods = "CTRL", action = act.ActivateTab(9) },
  
  -- Pane management
  { key = "\\", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
  { key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
  { key = "c", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },
  
  -- Window management
  { key = "n", mods = "CTRL|SHIFT", action = act.SpawnWindow },
  { key = "f", mods = "CTRL|SHIFT", action = act.ToggleFullScreen },
  
  -- Font size
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },
  
  -- Search
  { key = "f", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
  
  -- Reload config
  { key = "r", mods = "CTRL|SHIFT", action = act.ReloadConfiguration },
  
  -- Clear scrollback
  { key = "k", mods = "CTRL|SHIFT", action = act.ClearScrollback("ScrollbackAndViewport") },
  
  -- Copy mode
  { key = "[", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
  
  -- Quick select
  { key = "Space", mods = "CTRL|SHIFT", action = act.QuickSelect },
  
  -- Character picker
  { key = "c", mods = "CTRL|SHIFT", action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }) },
}

-- Mouse bindings
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "SHIFT",
    action = act.SelectTextAtMouseCursor("Cell"),
  },
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL|SHIFT",
    action = act.SelectTextAtMouseCursor("Word"),
  },
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "CTRL|SHIFT|ALT",
    action = act.SelectTextAtMouseCursor("Line"),
  },
}

-- Performance settings
config.max_fps = 60
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Behavior settings
config.enable_kitty_graphics = true
config.enable_wayland = true
config.scrollback_lines = 10000
config.default_workspace = "default"

-- Automatically hide mouse cursor when typing
config.hide_mouse_cursor_when_typing = true

-- Allow square fonts
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

-- Disable ligatures for certain fonts
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Window size
config.initial_cols = 120
config.initial_rows = 30

-- Startup commands
config.default_prog = { "/bin/zsh" }

-- Environment variables
config.set_environment_variables = {
  TERM = "wezterm",
  COLORTERM = "truecolor",
}

-- Hyperlink rules
config.hyperlink_rules = {
  {
    regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
    format = "$0",
  },
  {
    regex = "\\b\\w+@[\\w-]+\\.[\\w.-]+\\b",
    format = "mailto:$0",
  },
  {
    regex = "\\bfile://\\S*\\b",
    format = "$0",
  },
  {
    regex = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b",
    format = "http://$0",
  },
}

-- Smart tab titles
config.tab_title_format = function(tab)
  local title = tab.active_pane.title
  if title:match("^[^:]+://") then
    -- URL
    return title:gsub("^https?://", ""):gsub("/.*$", "")
  elseif title:match("^[^/]+@[^:]+:") then
    -- SSH
    return title:gsub("^[^/]+@([^:]+):.*$", "%1")
  elseif title:match("^[^/]+$") then
    -- Just a command name
    return title
  else
    -- File path
    return title:gsub("^.*/", "")
  end
end

-- Status bar
config.status_update_interval = 1000

-- Custom status bar
wezterm.on("update-status", function(window, pane)
  local cells = {}
  
  -- Add current working directory
  local cwd = pane:get_current_working_dir()
  if cwd then
    cwd = cwd:gsub("^file://[^/]*", ""):gsub("/Users/[^/]+", "~")
    table.insert(cells, cwd)
  end
  
  -- Add git branch if available
  local success, stdout, stderr = wezterm.run_child_process({"git", "rev-parse", "--abbrev-ref", "HEAD"})
  if success and stdout then
    local branch = stdout:gsub("%s+$", "")
    if branch and branch ~= "" then
      table.insert(cells, "git:" .. branch)
    end
  end
  
  -- Add timestamp
  local time = wezterm.strftime("%H:%M")
  table.insert(cells, time)
  
  -- Update status
  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#89b4fa" } },
    { Text = table.concat(cells, " | ") },
  }))
end)

-- Window events
wezterm.on("window-config-reloaded", function(window)
  window:toast_notification("WezTerm", "Configuration reloaded!", nil, 4000)
end)

-- Pane events
wezterm.on("user-var-changed", function(window, pane, name, value)
  wezterm.log_info("user var changed", name, value)
end)

-- Return the configuration
return config
