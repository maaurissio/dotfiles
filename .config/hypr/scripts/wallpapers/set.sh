#!/bin/bash
set -euo pipefail

WALL="${1:-}"

[ -z "$WALL" ] && exit 1
[ ! -f "$WALL" ] && exit 1

# Wallpaper con awww
awww img "$WALL" --transition-type center --transition-step 90

# Pywal
if command -v wal >/dev/null 2>&1; then
    wal -i "$WALL"
    "$HOME/.config/swaync/update-colors.sh"
fi

# Teclado opcional
[ -x "$HOME/.config/keyboard/set-color-keyboard.sh" ] && \
    "$HOME/.config/keyboard/set-color-keyboard.sh" >/dev/null 2>&1 &

# Waybar
pkill waybar 2>/dev/null || true
sleep 0.3
waybar >/dev/null 2>&1 & disown

# SwayNC
pkill -9 swaync 2>/dev/null || true
sleep 0.5
swaync >/dev/null 2>&1 & disown

notify-send "Wallpaper aplicado" "$(basename "$WALL")" 2>/dev/null || true