local monitors = hl.get_monitors()

--------------------
---- workspaces ----
--------------------

hl.workspace_rule({ workspace = "1", layout = "dwindle",   persistent = true, monitor = monitors[1].name , default = true })
hl.workspace_rule({ workspace = "2", layout = "dwindle",   persistent = true, })
hl.workspace_rule({ workspace = "3", layout = "master",    persistent = true, })
hl.workspace_rule({ workspace = "4", layout = "scrolling", persistent = true, })

hl.workspace_rule({ workspace = "5", layout = "scrolling", persistent = true, })
hl.workspace_rule({ workspace = "6", layout = "master",    persistent = true, })
hl.workspace_rule({ workspace = "7", layout = "dwindle",   persistent = true, })
hl.workspace_rule({ workspace = "8", layout = "dwindle",   persistent = true, monitor = monitors[2].name , default = true })


hl.config({
    dwindle = {
        force_split = 0,
        preserve_split = true,
        smart_split = true,
        smart_resizing = true,
    },

    master = {
        mfact = 0.6,
        new_status = "inherit",
        new_on_top = true,
    },

    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 1.0,
        direction = "down",
    },
})

-----------------
---- windows ----
-----------------

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- KDE Connect Presentation Mode
hl.window_rule({
    name = "kdeconnect-presentation",

    match = {
        title = "^KDE Connect Daemon$"
    },

    float = true,
    pin = true,
    opacity = 1.0,
    no_blur = true,
    no_shadow = true,
    no_focus = true,
    animation = "none",
    move = { 0, 0 },
    size = { "(monitor_w)", "(monitor_h)" },
})

-- Steam settings
hl.window_rule({
    name  = "Steam Settings",
    match = {
        class = "steam",
        title = "Steam Settings",
    },
    float = true,
})

-- Steam friends list
hl.window_rule({
    name  = "Steam Friends",
    match = {
        class = "steam",
        title = "Friends List",
    },
    float = true,
})

hl.window_rule({ match = { class = "*osu.*" }, immediate = true })

