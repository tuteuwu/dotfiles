from libqtile.lazy import lazy
from libqtile.config import Click, Drag, Key

# mod keys
mod = "mod4"
alt = "mod1"
ctrl = "control"

ter = "kitty"
launcher = "rofi -show run"
screenshot = "flameshot gui"

keys = [

    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, alt], "h", lazy.layout.move_left(), desc="Move window to the left"),
    Key([mod, alt], "l", lazy.layout.move_right(), desc="Move window to the right"),
    Key([mod, alt], "j", lazy.layout.move_down(), desc="Move window down"),
    Key([mod, alt], "k", lazy.layout.move_up(), desc="Move window up"),

    Key([mod, "shift"], "h", lazy.layout.integrate_left(), desc="Integrate window to the left"),
    Key([mod, "shift"], "l", lazy.layout.integrate_right(), desc="Integrate window to the right"),
    Key([mod, "shift"], "j", lazy.layout.integrate_down(), desc="Integrate window down"),
    Key([mod, "shift"], "k", lazy.layout.integrate_up(), desc="Integrate window up"),

    Key([mod, ctrl], "h", lazy.layout.grow_width(30), desc="increase window width"),
    Key([mod, ctrl], "l", lazy.layout.grow_width(-30), desc="decrease window width"),
    Key([mod, ctrl], "j", lazy.layout.grow_height(-30), desc="decrease window height"),
    Key([mod, ctrl], "k", lazy.layout.grow_height(30), desc="increase window height"),


    
    Key([mod], "v", lazy.window.toggle_floating()),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod, ctrl], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, ctrl], "q", lazy.shutdown(), desc="Shutdown Qtile"),


    Key([mod], "r", lazy.spawn(launcher), desc="Spawn app launcher"),
    Key([mod], "Return", lazy.spawn(ter), desc="Launch terminal"),
    Key([mod, "shift"], "s", lazy.spawn(screenshot)),



    Key([mod], "1", lazy.group["1"].toscreen()),
    Key([mod], "2", lazy.group["2"].toscreen()),
    Key([mod], "3", lazy.group["3"].toscreen()),
    Key([mod], "4", lazy.group["4"].toscreen()),
    Key([mod], "5", lazy.group["5"].toscreen()),
    Key([mod], "6", lazy.group["6"].toscreen()),
    Key([mod], "7", lazy.group["7"].toscreen()),
    Key([mod], "8", lazy.group["8"].toscreen()),
    Key([mod], "9", lazy.group["9"].toscreen()),
    Key([mod], "0", lazy.group["0"].toscreen()),

]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]