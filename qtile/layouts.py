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

layouts = [
    layout.MonadTall(
        border_normal=colors["dark-bg"],
        border_focus=colors["light-bg"],
        border_width=ui["borders_width"],
        single_border_width=ui["borders_width"],
        margin=ui["margin"],
        ),
    layout.MonadWide(
        border_normal=colors["dark-bg"],
        border_focus=colors["light-bg"],
        border_width=ui["borders_width"],
        single_border_width=ui["borders_width"],
        margin=ui["margin"],
        ),
    layout.MonadTall(
        align=1,
        border_normal=colors["dark-bg"],
        border_focus=colors["light-bg"],
        border_width=ui["borders_width"],
        single_border_width=ui["borders_width"],
        margin=ui["margin"],
        ),
    layout.MonadWide(
        align=1,
        border_normal=colors["dark-bg"],
        border_focus=colors["light-bg"],
        border_width=ui["borders_width"],
        single_border_width=ui["borders_width"],
        margin=ui["margin"],
        ),
]

floating_layout = layout.Floating(
    border_normal=colors["dark-bg"],
    border_focus=colors["light-bg"],
    

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