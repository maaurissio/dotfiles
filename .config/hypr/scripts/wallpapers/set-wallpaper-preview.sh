#!/bin/bash
set -euo pipefail

WALL_DIR="$HOME/.config/wallpapers"

choice=$(
    find "$WALL_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read -r img; do
        name=$(basename "$img")
        printf "%s\0icon\x1f%s\n" "$name" "$img"
    done | rofi -dmenu -i -show-icons -theme "$HOME/.config/rofi/wallpaper.rasi" -p ""
)

[ -z "${choice:-}" ] && exit 0

wallpaper=$(find "$WALL_DIR" -type f -name "$choice" | head -n 1)

[ -z "$wallpaper" ] && exit 0

"$HOME/.config/hypr/scripts/wallpapers/set.sh" "$wallpaper"