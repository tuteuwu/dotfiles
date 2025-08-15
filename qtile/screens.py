from libqtile.config import Screen
from libqtile import bar, qtile, widget, hook
from qtile_extras import widget as extras_widget
from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule
import json, os

# Theme
home = os.path.expanduser("~")
with open(os.path.join(home, ".config/qtile/theme.json"), "r") as f:
    theme = json.load(f)

colors = theme['base16']
ui = theme['ui']

widget_defaults = dict(
    font = ui['font'],
    fontsize = ui['font_size'],
    fontshadow = colors["black"],
    padding = ui["padding"],
)
extension_defaults = widget_defaults.copy()

screens = [
    #First screen
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(2),
                extras_widget.GroupBox2(
                    padding = ui["padding"],
                    fontsize = 12,
                    font = "Symbols Nerd Font Mono",
                    rules=[
                        GroupBoxRule(text_colour = colors["black"]).when(occupied=False),
                        GroupBoxRule(text_colour = colors["blue"]).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(text="").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="").when(occupied=True),
                        GroupBoxRule(text="").when(occupied=False),
                    ]
                ),
                widget.Spacer(),
                widget.Clock(
                    format="%H:%M",
                    font = "MBF Nanomaton Bold",
                    fontsize = 16
                ),
                widget.Spacer(),
                widget.Systray(),
                widget.Spacer(2)
            ],
            32,
            margin=ui["margin"],
            opacity=1.0,
            background = "#28282880",
        ),
        x11_drag_polling_rate = 60
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(2),
                extras_widget.GroupBox2(
                    padding = ui["padding"],
                    fontsize = 12,
                    font = "Symbols Nerd Font Mono",
                    rules=[
                        GroupBoxRule(text_colour = colors["black"]).when(occupied=False),
                        GroupBoxRule(text_colour = colors["blue"]).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(text="").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="").when(occupied=True),
                        GroupBoxRule(text="").when(occupied=False),
                    ]
                ),
                widget.Spacer(),
                widget.Clock(
                    format="%H:%M",
                    font = "MBF Nanomaton Bold",
                    fontsize = 16
                ),
                widget.Spacer()
            ],
            32,
            margin=ui["margin"],
            opacity=1.0,
            background = "#28282880",
        ),
        x11_drag_polling_rate = 60
    ),
]
