from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy
from keys import keys
import re

# mod keys
mod = "mod4"
alt = "mod1"

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # mod + alt + group number = move focused window to group
            Key(
                [mod, alt],
                i.name,
                lazy.window.togroup(i.name),
                desc="move focused window to group {i.name}"),
        ]
    )

