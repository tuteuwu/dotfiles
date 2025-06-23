
from libqtile.config import Group, Key, Match, Screen
from libqtile.lazy import lazy
from keys import keys
import re

# mod keys
mod = "mod4"
alt = "mod1"

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
