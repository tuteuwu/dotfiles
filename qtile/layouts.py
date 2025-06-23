from qtile_extras import layout
from qtile_extras.layout.decorations import GradientFrame
from libqtile.config import Match
import json, os

# Theme
home = os.path.expanduser("~")
with open(os.path.join(home, ".config/qtile/theme.json"), "r") as f:
    theme = json.load(f)

colors = theme['base16']
ui = theme['ui']

Background = colors["color01"]
Foreground = colors["color06"]

color_primary = colors["color14"]
color_secondary = colors["color07"]

borders = ui['borders_width']
margin = ui['margin']
transparency = ui['transparency']
padd = ui['padding']

layouts = [
    layout.MonadTall(
        border_normal=Background,
        border_focus=color_primary,
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