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

Background = colors["color01"]
Foreground = colors["color06"]

lightBackground = colors["color01"]
black = colors["color00"]

color_primary = colors["color14"]
color_secondary = colors["color07"]

wallpaperDir = "/home/tute/Pictures/Wallpaper/Mocha/Astolfo.png"


borders = ui['borders_width']
margin = ui['margin']
transparency = ui['transparency']
padd = ui['padding']



widget_defaults = dict(
    font = ui['font'],
    fontsize = ui['font_size'],
    fontshadow = colors['color00'],
    padding = ui["padding"],
)
extension_defaults = widget_defaults.copy()

screens = [
    #First screen
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=2),
                widget.Systray(),
                widget.Spacer(),
                extras_widget.GroupBox2(
                    padding = padd,
                    fontsize = 12,
                    font = "Symbols Nerd Font",
                    rules=[
                        GroupBoxRule(text_colour = black).when(occupied=False),
                        GroupBoxRule(text_colour = color_primary).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(line_colour=color_primary).when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(line_colour=black).when(GroupBoxRule.SCREEN_OTHER),
                        GroupBoxRule(text="").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="").when(occupied=True),
                        GroupBoxRule(text="").when(occupied=False),
                    ]
                ),
                widget.Spacer(),

                widget.Clock(
                    format=" %H:%M  "
                ) 
            ],
            32,
            margin=margin,
            opacity=1.0,
            border_color=color_primary,
            background = lightBackground,
        ),
        wallpaper=wallpaperDir,
        wallpaper_mode = 'fill',
        x11_drag_polling_rate = 60
    ),
    #Second Screen
    Screen(
        top=bar.Bar(
            [
                widget.Clock(
                    format="  %H:%M  "
                ),
                widget.Spacer(),
                extras_widget.GroupBox2(
                    padding = padd,
                    fontsize = 12,
                    font = "Symbols Nerd Font",
                    rules=[
                        GroupBoxRule(text_colour = black).when(occupied=False),
                        GroupBoxRule(text_colour = color_primary).when(GroupBoxRule.SCREEN_ANY),
                        GroupBoxRule(line_colour=color_primary).when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(line_colour=black).when(GroupBoxRule.SCREEN_OTHER),
                        GroupBoxRule(text="").when(GroupBoxRule.SCREEN_THIS),
                        GroupBoxRule(text="").when(occupied=True),
                        GroupBoxRule(text="").when(occupied=False),
                    ]
                ),
                widget.Spacer()
            ],
            32,
            margin=margin,
            opacity=1.0,
            border_color=color_primary,
            background = lightBackground,
        ),
        wallpaper=wallpaperDir,
        wallpaper_mode = 'fill',
        x11_drag_polling_rate = 60
    ),
]
