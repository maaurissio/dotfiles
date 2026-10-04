-- Mouse: en tu config vieja tenias accel_profile = flat (sin aceleracion, 1 a 1),
-- Caelestia por defecto no fija esto y usa la curva de aceleracion adaptativa de Hyprland,
-- que se siente "mas rapido"/menos predecible en movimientos rapidos.
hl.config({
    input = {
        sensitivity = 0,
        accel_profile = "flat",
    },
})

-- HyprFM: mantener su tema "caelestia" sincronizado en vivo con el esquema de colores dinamico
hl.on("hyprland.start", function()
    hl.exec_cmd("bash ~/.config/hyprfm/watch-theme.sh")
end)

-- SUPER+R: wallpaper aleatorio (busca en ~/Imagenes/Wallpapers) + recolorea todo el sistema
hl.bind("SUPER + R", hl.dsp.exec_cmd("caelestia wallpaper -r \"" .. os.getenv("HOME") .. "/Imágenes/Wallpapers\""))
