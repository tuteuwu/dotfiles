require("personal")
require("keybinds")
require("workspace")
require("animations")
require("colors")

------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})


-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("dunst & nm-applet & hyprpaper")
	hl.exec_cmd("quickshell")
	hl.exec_cmd("systemctl --user start opentabletdriver")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "16")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("GTK_THEME", "Adwaita:dark")
hl.env("XDG_DATA_DIRS", "/var/lib/flatpak/exports/share:/usr/local/share:/usr/share")


-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 2,
		col = {
			active_border = colors.accent0,
			inactive_border = colors.base0,
		},
		resize_on_border = true,
		extend_border_grab_area = 16,
		allow_tearing = true,
		snap = {
			enabled = true,
			window_gap = 8,
			monitor_gap = 8,
		},
	},
	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 8,
			render_power = 4,
			color = colors.base0,
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.5,
			popups = true,
		},
	},

	input = {
		kb_layout = keyboard_layout,
		kb_variant = keyboard_variant,
		accel_profile = "flat",
		natural_scroll = false,
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
		tablet = {},
		tablettool = {},
	},
	cursor = {
		enable_hyprcursor = true,
		no_hardware_cursors = 1,
	},
	misc = {
		force_default_wallpaper = 2,
		disable_hyprland_logo = false,
		disable_splash_rendering = false,
		font_family = "IBM Plex Mono",
		middle_click_paste = false,
	},
	ecosystem = {
		enforce_permissions = false,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})


hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl reload")
	if wallpaper == nil or wallpaper == "" then
    	hl.exec_cmd("swaybg -c " .. colors.surface0)
	else
    	hl.exec_cmd("swaybg -c " .. colors.surface0 .. " -i " .. wallpaper .. " -m fill")
	end
end)