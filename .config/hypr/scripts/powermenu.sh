#!/bin/bash

option=$(printf "Apagar\nReiniciar\nSuspender\nCerrar sesión" | wofi --dmenu --prompt "Power Menu")

case $option in
    "Apagar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Cerrar sesión")
        hyprctl dispatch exit
        ;;
esac
