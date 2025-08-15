from libqtile import hook

from keys import keys, mouse    # Keybinds
from groups import groups       # Groups
from layouts import layouts     # Layouts
from screens import screens     # Screens
import os, subprocess

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = True
floats_kept_above = True
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():

    processes = [ 
            ['picom'],
            ['vesktop']
        ]
    for p in processes:
        subprocess.Popen(p)
