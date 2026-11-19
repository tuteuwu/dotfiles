require("personal")

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + " .. "s", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + SHIFT + " .. "z", hl.dsp.exec_cmd(picker))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))


-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + " .. " + left",  hl.dsp.window.move({ direction = "left", group_aware = false }))
hl.bind(mainMod .. " + SHIFT + " .. " + right", hl.dsp.window.move({ direction = "right", group_aware = false  }))
hl.bind(mainMod .. " + SHIFT + " .. " + up",    hl.dsp.window.move({ direction = "up", group_aware = false  }))
hl.bind(mainMod .. " + SHIFT + " .. " + down",  hl.dsp.window.move({ direction = "down", group_aware = false  }))

hl.bind(mainMod .. " + ALT + " .. " + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + ALT + " .. " + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + ALT + " .. " + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + ALT + " .. " + down",  hl.dsp.window.swap({ direction = "down" }))

-- Switch workspaces with mainMod + [0-8]
-- Move active window to a workspace with mainMod + SHIFT + [0-8]
-- Discrete Move active window to a workspace with mainMod + ALT + [0-8]
hl.bind(mainMod .. " + " .. "1",             hl.dsp.focus({ workspace = 1, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "1",     hl.dsp.window.move({ workspace = 1, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "1",       hl.dsp.window.move({ workspace = 1, follow = false }))

hl.bind(mainMod .. " + " .. "2",             hl.dsp.focus({ workspace = 2, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "2",     hl.dsp.window.move({ workspace = 2, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "2",       hl.dsp.window.move({ workspace = 2, follow = false }))

hl.bind(mainMod .. " + " .. "3",             hl.dsp.focus({ workspace = 3, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "3",     hl.dsp.window.move({ workspace = 3, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "3",       hl.dsp.window.move({ workspace = 3, follow = false }))

hl.bind(mainMod .. " + " .. "4",             hl.dsp.focus({ workspace = 4, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "4",     hl.dsp.window.move({ workspace = 4, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "4",       hl.dsp.window.move({ workspace = 4, follow = false }))

hl.bind(mainMod .. " + " .. "7",             hl.dsp.focus({ workspace = 5, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "7",     hl.dsp.window.move({ workspace = 5, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "7",       hl.dsp.window.move({ workspace = 5, follow = false }))

hl.bind(mainMod .. " + " .. "8",             hl.dsp.focus({ workspace = 6, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "8",     hl.dsp.window.move({ workspace = 6, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "8",       hl.dsp.window.move({ workspace = 6, follow = false }))

hl.bind(mainMod .. " + " .. "9",             hl.dsp.focus({ workspace = 7, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "9",     hl.dsp.window.move({ workspace = 7, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "9",       hl.dsp.window.move({ workspace = 7, follow = false }))

hl.bind(mainMod .. " + " .. "0",             hl.dsp.focus({ workspace = 8, on_current_monitor = true }))
hl.bind(mainMod .. " + SHIFT + " .. "0",     hl.dsp.window.move({ workspace = 8, follow = true }))
hl.bind(mainMod .. " + ALT + " .. "0",       hl.dsp.window.move({ workspace = 8, follow = false }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- Shotcuts

hl.bind(mainMod .. " + F1", hl.dsp.pass({ window = [[class:com\.obsproject\.Studio]] }))

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("qs ipc call menu toggle"))
