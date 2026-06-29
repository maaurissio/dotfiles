# dotfiles

Config personal para Hyprland en Arch Linux.

## Qué incluye

- **Hyprland** — keybinds, animaciones, transparencia, blur, reglas de ventana
- **Waybar** — barra con múltiples layouts
- **Kitty** — terminal con tema personalizado
- **Neovim** — config completa con lazy.nvim
- **Rofi / Wofi** — launchers con tema
- **SwayNC** — notificaciones con colores dinámicos
- **Fastfetch** — con ascii arts personalizados
- **Pywal** — colores que se adaptan al fondo de pantalla
- **Cava** — visualizador de audio
- **btop** — monitor del sistema
- **Wallpapers** — 31 fondos de pantalla en `.config/wallpapers/`
- **Shell** — `.zshrc`, `.gitconfig`, `.npmrc`

## Dependencias

Instalar con `yay` o `pacman`:

```bash
# WM y compositor
yay -S hyprland hyprpaper hypridle hyprlock

# Barra y notificaciones
yay -S waybar swaync

# Terminal y editor
yay -S kitty neovim

# Launchers
yay -S rofi-wayland wofi

# Wallpaper y colores dinámicos
yay -S python-pywal awww

# Utilidades
yay -S fastfetch btop cava cliphist wl-clipboard

# Fuentes (requeridas por waybar y kitty)
yay -S ttf-jetbrains-mono-nerd
```

## Instalación

```bash
git clone https://github.com/maaurissio/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

El script crea symlinks de todos los archivos a su lugar correspondiente en `$HOME`.

## Colores dinámicos (pywal)

Al cambiar el wallpaper con `Super+R` (aleatorio) o `Super+V > wallpaper`, se ejecuta `wal` automáticamente y regenera los colores para waybar, swaync, hyprlock y kitty.
