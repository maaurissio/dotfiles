#!/bin/bash

option=$(printf "Apagar\nReiniciar\nReiniciar en Windows\nSuspender\nCerrar sesión" | wofi --dmenu --prompt "Power Menu")

case $option in
    "Apagar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Reiniciar en Windows")
        sudo grub-reboot "Windows Recovery Environment (en /dev/sdc1)"
        systemctl reboot
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Cerrar sesión")
        hyprctl dispatch exit
        ;;
esac
