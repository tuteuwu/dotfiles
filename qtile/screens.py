from libqtile.config import Screen
from libqtile import bar, qtile, hook
from qtile_extras import widget as widget
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
    foreground = colors["base-fg"]
)
extension_defaults = widget_defaults.copy()

screens = [
    #First screen
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(2),
                widget.GroupBox2(
                    font = "Symbols Nerd Font Mono",
                    rules=[
                        GroupBoxRule(text_colour = colors["black"]).when(occupied=False),
                        GroupBoxRule(text_colour = colors["blue"]).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(text_colour = colors["base-fg"]).when(occupied=True),
                        GroupBoxRule(text="").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="").when(occupied=True),
                        GroupBoxRule(text="").when(occupied=False),
                    ]
                ),
                widget.Spacer(32),
                widget.GlobalMenu(),
                widget.Spacer(),
                widget.Clock(
                    format="%H:%M",
                    fontsize = 16,
                    foreground = colors["base-fg"]
                ),
                widget.Spacer(),
                
                widget.Systray(),
                widget.UPowerWidget(
                    background = colors["dark-bg"],
                    border_charge_colour = colors["aqua"],
                    border_colour = colors["base-fg"],
                    border_critical_colour = colors["red"],
                    fill_charge = colors["base-fg"],
                    fill_critical = colors["base-fg"],
                    fill_low = colors["base-fg"],
                    fill_normal = colors["base-fg"],

                ),
                widget.Spacer(2)
            ],
            32,
            margin=ui["margin"],
            opacity=1.0,
            background = "#28282880",
        ),
        x11_drag_polling_rate = 60
    )
]
