from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget as extras_widget
from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule
import os, subprocess, json, re


# mod keys
mod = "mod4"
alt = "mod1"

# Theme
home = os.path.expanduser("~")
with open(os.path.join(home, ".config/qtile/theme.json"), "r") as f:
    theme = json.load(f)


colors = theme['base16']
ui = theme['ui']

Background = colors["color0"]
Foreground = colors["color8"]

color_primary = colors["color7"]
color_secondary = colors["color7"]

wallpaper = "Pictures/wallpaper/teto.png"


borders = ui['borders_width']
margin = ui['margin']
transparency = ui['transparency']
padd = ui['padding']

keys = [

    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",),

    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch terminal"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("rofi -show run"), desc="Spawn rofi"),

    # Screenshot with flameshot
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    Key([mod], "v", lazy.window.toggle_floating()),
    Key([mod, alt], "p", lazy.hide_show_bar(position="bottom"))
]

group = {
    1: Group("1"),
    2: Group("2"),
    3: Group("3"),
    4: Group("4", matches=[Match(wm_class=re.compile(r"^(code)$"))]),
    8: Group("8", matches=[Match(wm_class=re.compile(r"^(steam)$"))]),
    9: Group("9", matches=[Match(wm_class=re.compile(r"^(discord)$"))]),
    0: Group("0"),
}

groups = list(group.values())

def getGroupKey(name):
    return [k for k, g in group.items() if g.name == name] [0]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                str(getGroupKey(i.name)),
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(getGroupKey(i.name)),
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # mod + alt + group number = switch focused window to group
            Key(
                [mod, alt],
                str(getGroupKey(i.name)),
                lazy.window.togroup(i.name),
                desc=f"move focused window to group {i.name}"
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        border_normal=Background,
        border_focus=[color_primary, color_secondary],
        border_width=borders,
        single_border_width=borders,
        margin=margin,
        ),
    layout.MonadWide(
        border_normal=Background,
        border_focus=color_primary,
        border_width=borders,
        single_border_width=borders,
        margin=margin,
        ),
    layout.MonadTall(
        align=1,
        border_normal=Background,
        border_focus=color_primary,
        border_width=borders,
        single_border_width=borders,
        margin=margin,
        ),
    layout.MonadWide(
        align=1,
        border_normal=Background,
        border_focus=color_primary,
        border_width=borders,
        single_border_width=borders,
        margin=margin,
        ),
]

widget_defaults = dict(
    font = ui['font'],
    fontsize = ui['font_size'],
    fontshadow = colors['color0'],
    padding = ui["padding"],
)
extension_defaults = widget_defaults.copy()

screens = [
    #First screen
    Screen(
        top=bar.Bar(
            [
                widget.Systray(),
                widget.Spacer(),
                extras_widget.GroupBox2(
                    padding = padd,
                    fontsize = 16,
                    rules=[
                        GroupBoxRule(text_colour = Background).when(occupied=False),
                        GroupBoxRule(text_colour = color_primary).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(line_colour=color_primary).when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(line_colour=Background).when(GroupBoxRule.SCREEN_OTHER),
                        GroupBoxRule(text="◉").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="◎").when(occupied=True),
                        GroupBoxRule(text="○").when(occupied=False),
                    ]
                ),

                extras_widget.WordClock(
                    active = color_primary,
                    background = '#000000',
                    fontsize = 80,
                    update_iterval = 5,
                    language = 'Finnish'
                    # that bitch dog blowjob what dont work lol
                ),
                widget.Spacer(),

                widget.Clock(
                    format="%H:%M ",
                    background='#00000000',
                ) 
            ],
            32,
            #margin=margin,
            opacity=1.0,
            border_color=color_primary,
            background = '#00000000',
        ),
        #wallpaper = wallpaper,
        wallpaper_mode = 'fill',
        x11_drag_polling_rate = 60,
        bottom=bar.Bar(
            [
                widget.CPU(),
                widget.CPUGraph(
                    type='box',
                    fill_color=color_primary,
                    border_width=0,
                    margin_y=0,
    
    
                ),
    
                widget.Memory(measure_mem= 'G'),
                widget.MemoryGraph(
                    type='box',
                    fill_color=color_primary,
                    border_width=0,
                    margin_y=0,
                ),
                widget.Spacer(),
                widget.Net()
    
    
            ],
            32,
            opacity=1.0,
            border_color=color_primary,
            border_width=[borders, 0, 0, 0],
            background = '#0000007F',
            reserve=False
        ),

    ),
    #Second Screen
    Screen(
        top=bar.Bar(
            [
                widget.Clock(
                    format="%H:%M ",
                    background='#00000000',
                ),
                widget.Spacer(),
                extras_widget.GroupBox2(
                    padding = padd,
                    fontsize = 16,
                    rules=[
                        GroupBoxRule(text_colour = Background).when(occupied=False),
                        GroupBoxRule(text_colour = color_primary).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(line_colour=color_primary).when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(line_colour=Background).when(GroupBoxRule.SCREEN_OTHER),
                        GroupBoxRule(text="◉").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="◎").when(occupied=True),
                        GroupBoxRule(text="○").when(occupied=False),
                    ]
                ),

                widget.Spacer(),
                extras_widget.WordClock(
                    active = color_primary,
                    background = '#000000',
                    fontsize = 80,
                    update_iterval = 5,
                    line_colour = color_primary
                    # that bitch dog blowjob what dont work lol
                ),

            ],
            32,
            opacity=1.0,
            border_color=color_primary,
            background = '#00000000',
        ),
        wallpaper_mode = 'fill',
        x11_drag_polling_rate = 60
    ),


]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_width = borders,
    border_focus = color_primary,
    

    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"

@hook.subscribe.startup
def somestartup():
    qtile.cmd_hide_show_bar(position="bottom")


@hook.subscribe.startup_once
def autostart():

    processes = [ 
            ['picom'],
            ['discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy']
        ]
    for p in processes:
        subprocess.Popen(p)

# This code is property of neco arc
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡔⣻⠁⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⢀⣾⠳⢶⣦⠤⣀⠀⠀⠀⠀⠀⠀⠀⣾⢀⡇⡴⠋⣀⠴⣊⣩⣤⠶⠞⢹⣄⠀⠀⠀
#⠀⠀⠀⠀⢸⠀⠀⢠⠈⠙⠢⣙⠲⢤⠤⠤⠀⠒⠳⡄⣿⢀⠾⠓⢋⠅⠛⠉⠉⠝⠀⠼⠀⠀⠀
#⠀⠀⠀⠀⢸⠀⢰⡀⠁⠀⠀⠈⠑⠦⡀⠀⠀⠀⠀⠈⠺⢿⣂⠀⠉⠐⠲⡤⣄⢉⠝⢸⠀⠀⠀
#⠀⠀⠀⠀⢸⠀⢀⡹⠆⠀⠀⠀⠀⡠⠃⠀⠀⠀⠀⠀⠀⠀⠉⠙⠲⣄⠀⠀⠙⣷⡄⢸⠀⠀⠀
#⠀⠀⠀⠀⢸⡀⠙⠂⢠⠀⠀⡠⠊⠀⠀⠀⠀⢠⠀⠀⠀⠀⠘⠄⠀⠀⠑⢦⣔⠀⢡⡸⠀⠀⠀
#⠀⠀⠀⠀⢀⣧⠀⢀⡧⣴⠯⡀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⢸⡠⠔⠈⠁⠙⡗⡤⣷⡀⠀⠀
#⠀⠀⠀⠀⡜⠈⠚⠁⣬⠓⠒⢼⠅⠀⠀⠀⣠⡇⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⡀⢹⠀⠸⡄⠀⠀
#⠀⠀⠀⡸⠀⠀⠀⠘⢸⢀⠐⢃⠀⠀⠀⡰⠋⡇⠀⠀⠀⢠⠀⠀⡿⣆⠀⠀⣧⡈⡇⠆⢻⠀⠀
#⠀⠀⢰⠃⠀⠀⢀⡇⠼⠉⠀⢸⡤⠤⣶⡖⠒⠺⢄⡀⢀⠎⡆⣸⣥⠬⠧⢴⣿⠉⠁⠸⡀⣇⠀
#⠀⠀⠇⠀⠀⠀⢸⠀⠀⠀⣰⠋⠀⢸⣿⣿⠀⠀⠀⠙⢧⡴⢹⣿⣿⠀⠀⠀⠈⣆⠀⠀⢧⢹⡄
#⠀⣸⠀⢠⠀⠀⢸⡀⠀⠀⢻⡀⠀⢸⣿⣿⠀⠀⠀⠀⡼⣇⢸⣿⣿⠀⠀⠀⢀⠏⠀⠀⢸⠀⠇
#⠀⠓⠈⢃⠀⠀⠀⡇⠀⠀⠀⣗⠦⣀⣿⡇⠀⣀⠤⠊⠀⠈⠺⢿⣃⣀⠤⠔⢸⠀⠀⠀⣼⠑⢼
#⠀⠀⠀⢸⡀⣀⣾⣷⡀⠀⢸⣯⣦⡀⠀⠀⠀⢇⣀⣀⠐⠦⣀⠘⠀⠀⢀⣰⣿⣄⠀⠀⡟⠀⠀
#⠀⠀⠀⠀⠛⠁⣿⣿⣧⠀⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⣿⣿⡿⠈⠢⣼⡇⠀⠀
#⠀⠀⠀⠀⠀⠀⠈⠁⠈⠻⠈⢻⡿⠉⣿⠿⠛⡇⠒⠒⢲⠺⢿⣿⣿⠉⠻⡿⠁⠀⠀⠈⠁⠀⠀
#⢀⠤⠒⠦⡀⠀⠀⠀⠀⠀⠀⠀⢀⠞⠉⠆⠀⠀⠉⠉⠉⠀⠀⡝⣍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⡎⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⡰⠋⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⢡⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⡇⠀⠀⠸⠁⠀⠀⠀⠀⢀⠜⠁⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠘⡄⠈⢳⡀⠀⠀⠀⠀⠀⠀⠀
#⡇⠀⠀⢠⠀⠀⠀⠀⠠⣯⣀⠀⠀⠀⡰⡇⠀⠀⠀⠀⠀⠀⠀⠀⢣⠀⢀⡦⠤⢄⡀⠀⠀⠀⠀
#⢱⡀⠀⠈⠳⢤⣠⠖⠋⠛⠛⢷⣄⢠⣷⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⡾⢳⠃⠀⠀⠘⢇⠀⠀⠀
#⠀⠙⢦⡀⠀⢠⠁⠀⠀⠀⠀⠀⠙⣿⣏⣀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣧⡃⠀⠀⠀⠀⣸⠀⠀⠀
#⠀⠀⠀⠈⠉⢺⣄⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⣤⣀⣠⡾⠃⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠣⢅⡤⣀⣀⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠉⠉⠉⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠁⠀⠉⣿⣿⣿⣿⣿⡿⠻⣿⣿⣿⣿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⠀⠀⠀⠀⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣟⠀⠀⢠⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⠀⠀⢸⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠀⠀⢸⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⠉⠻⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀
#⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       
