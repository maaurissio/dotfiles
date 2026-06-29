#!/usr/bin/env bash
set -euo pipefail

WALL_DIR="$HOME/.config/wallpapers"

selected_name=$(find "$WALL_DIR" -type f \
  \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
  -printf "%f\n" | sort | wofi --dmenu \
    --prompt "󰸉 Wallpaper" \
    --width 620 \
    --height 420 \
    --insensitive)

[ -z "${selected_name:-}" ] && exit 0

wall="$WALL_DIR/$selected_name"

"$HOME/.config/hypr/scripts/wallpapers/set.sh" "$wall"