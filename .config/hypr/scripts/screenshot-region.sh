#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

AREA=$(slurp \
  -b "#00000022" \
  -c "#ffffff" \
  -s "#ffffff22" \
  -w 2 \
  -d)

[ -z "$AREA" ] && exit 0

sleep 0.1

grim -g "$AREA" "$FILE" && wl-copy < "$FILE"

if [ -f "$FILE" ]; then
    canberra-gtk-play -i camera-shutter 2>/dev/null &
fi