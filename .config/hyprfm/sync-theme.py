#!/usr/bin/env python3
import re, os

home = os.path.expanduser("~")
src = f"{home}/.config/hypr/scheme/current.lua"
dst = f"{home}/.config/hyprfm/themes/caelestia.toml"

with open(src) as f:
    content = f.read()

vals = dict(re.findall(r'(\w+)\s*=\s*"([0-9a-fA-F]{6})"', content))

mapping = {
    "base": vals["background"],
    "mantle": vals["mantle"],
    "crust": vals["crust"],
    "surface": vals["surface0"],
    "overlay": vals["overlay0"],
    "text": vals["text"],
    "subtext": vals["subtext1"],
    "muted": vals["outline"],
    "accent": vals["primary"],
    "success": vals["success"],
    "warning": vals["term3"],
    "error": vals["error"],
}

toml = "[colors]\n" + "".join(f'{k} = "#{v}"\n' for k, v in mapping.items())

os.makedirs(os.path.dirname(dst), exist_ok=True)
with open(dst, "w") as f:
    f.write(toml)
