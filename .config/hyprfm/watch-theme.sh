#!/usr/bin/env bash
# Regenera el tema "caelestia" de HyprFM cada vez que cambia el esquema de colores.
# Caelestia reemplaza current.lua con un rename atomico, asi que vigilamos la
# CARPETA (moved_to/close_write) en vez del archivo puntual, o el watch se rompe
# despues del primer cambio.
SCHEME_DIR="$HOME/.config/hypr/scheme"
SCHEME_FILE="current.lua"
SYNC="$HOME/.config/hyprfm/sync-theme.py"

python3 "$SYNC"

if ! command -v inotifywait &>/dev/null; then
    notify-send "HyprFM theme sync" "Falta inotify-tools: instala con 'sudo pacman -S inotify-tools' para que el tema siga el wallpaper en vivo." 2>/dev/null
    exit 1
fi

inotifywait -m -e moved_to -e close_write --format '%f' "$SCHEME_DIR" 2>/dev/null | while read -r file; do
    if [ "$file" = "$SCHEME_FILE" ]; then
        python3 "$SYNC"
    fi
done
