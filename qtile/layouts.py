from libqtile.config import Match
from qtile_extras import layout
from qtile_extras.layout.decorations import GradientBorder
import json, os

# Theme
home = os.path.expanduser("~")
with open(os.path.join(home, ".config/qtile/theme.json"), "r") as f:
    theme = json.load(f)

colors = theme['base16']
ui = theme['ui']

layouts = [
    layout.Plasma(
        border_normal=colors["dark-bg"],
        border_normal_fixed=colors["dark-bg"],
        border_focus=GradientBorder(colours=[colors["blue"], colors["purple"]]),
        border_focus_fixed=GradientBorder(colours=[colors["blue"], colors["purple"]]),
        border_width=ui["borders_width"],
        border_width_single=ui["borders_width"],
        margin=ui["margin"],
        fair=True
    ),
    layout.Max(
        border_normal=colors["dark-bg"],
        border_focus=GradientBorder(colours=[colors["blue"], colors["purple"]]),
        border_width=ui["borders_width"],
        margin=ui["margin"],
    )
]

floating_layout = layout.Floating(
    border_normal=colors["dark-bg"],
    border_focus=GradientBorder(colours=[colors["blue"], colors["purple"]]),
    border_width=ui["borders_width"],

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