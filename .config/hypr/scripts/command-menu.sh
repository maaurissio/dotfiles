#!/usr/bin/env bash
set -euo pipefail

choice=$(printf "%s\n" \
  ">wallpaper" \
  ">apps" \
  ">power" \
  ">reload" \
  ">screenshot" \
  | wofi --dmenu \
      --prompt "󰣇" \
      --width 520 \
      --height 310 \
      --allow-markup \
      --insensitive)

case "$choice" in
  ">wallpaper")
    "$HOME/.config/hypr/scripts/wallpapers/set-wallpaper-preview.sh"
    ;;
  ">apps")
    wofi --show drun
    ;;
  ">power")
    "$HOME/.config/hypr/scripts/powermenu.sh"
    ;;
  ">reload")
    hyprctl reload
    ;;
  ">screenshot")
    scr_choice=$(printf "%s\n" \
      "Pantalla completa" \
      "Área" \
      | wofi --dmenu --prompt "󰹑" --width 320 --height 150 --insensitive) || exit 0
    DIR="$HOME/Pictures/Screenshots"
    mkdir -p "$DIR"
    FILE="$DIR/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
    sleep 0.3
    case "$scr_choice" in
      "Pantalla completa")
        grim "$FILE" && wl-copy < "$FILE"
        canberra-gtk-play -i camera-shutter 2>/dev/null &
        ;;
      "Área")
        AREA=$(slurp -b "#00000000" -c "#ffffff" -s "#ffffff22" -w 2 -d) || exit 0
        sleep 0.1
        grim -g "$AREA" "$FILE" && wl-copy < "$FILE"
        canberra-gtk-play -i camera-shutter 2>/dev/null &
        ;;
    esac
    ;;
  *)
    exit 0
    ;;
esac
