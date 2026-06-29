#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Paquetes ──────────────────────────────────────────────────────────────────

PACKAGES=(
  # WM
  hyprland hyprpaper hypridle hyprlock
  # Barra y notificaciones
  waybar swaync
  # Terminal y editor
  kitty neovim
  # Launchers
  rofi-wayland wofi
  # Wallpaper y colores dinámicos
  python-pywal swww
  # Utilidades de escritorio
  fastfetch btop cava cliphist wl-clipboard nautilus
  # Fuentes
  ttf-jetbrains-mono-nerd
  # Shell
  zsh
  # Apps
  google-chrome
  spotify
  visual-studio-code-bin
  vesktop-bin
)

install_packages() {
  if command -v yay &>/dev/null; then
    yay -S --needed --noconfirm "${PACKAGES[@]}"
  elif command -v paru &>/dev/null; then
    paru -S --needed --noconfirm "${PACKAGES[@]}"
  else
    echo "Instalando yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    yay -S --needed --noconfirm "${PACKAGES[@]}"
  fi
}

# ── Dotfiles ──────────────────────────────────────────────────────────────────

link_dotfiles() {
  # Archivos del home
  for file in .zshrc .gitconfig .npmrc .bash_profile .bashrc; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
      ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
      echo "  -> ~/$file"
    fi
  done

  # Directorios de .config
  mkdir -p "$HOME/.config"
  for dir in "$DOTFILES_DIR"/.config/*/; do
    name=$(basename "$dir")
    ln -sfn "$dir" "$HOME/.config/$name"
    echo "  -> ~/.config/$name"
  done
}

# ── Shell ─────────────────────────────────────────────────────────────────────

set_zsh() {
  if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Cambiando shell a zsh..."
    chsh -s "$(which zsh)"
  fi
}

# ── Discos ────────────────────────────────────────────────────────────────────

setup_disks() {
  sudo mkdir -p /mnt/Clips /mnt/Windows

  # grub-reboot sin contraseña
  echo "maurisio ALL=(ALL) NOPASSWD: /usr/bin/grub-reboot" \
    | sudo tee /etc/sudoers.d/grub-reboot > /dev/null
  sudo chmod 440 /etc/sudoers.d/grub-reboot

  # Entradas fstab (solo si no existen ya)
  if ! grep -q "4C002877002869E2" /etc/fstab; then
    echo "UUID=4C002877002869E2  /mnt/Clips    ntfs-3g  uid=1000,gid=1000,dmask=022,fmask=133,utf8,nofail  0  0" \
      | sudo tee -a /etc/fstab > /dev/null
    echo "  -> fstab: Clips agregado"
  fi

  if ! grep -q "DC36D1FF36D1DB1A" /etc/fstab; then
    echo "UUID=DC36D1FF36D1DB1A  /mnt/Windows  ntfs-3g  uid=1000,gid=1000,dmask=022,fmask=133,utf8,nofail,ro  0  0" \
      | sudo tee -a /etc/fstab > /dev/null
    echo "  -> fstab: Windows agregado"
  fi

  sudo systemctl daemon-reload
  sudo mount -a 2>/dev/null || true
}

# ── Main ──────────────────────────────────────────────────────────────────────

echo "==> Instalando paquetes..."
install_packages

echo "==> Enlazando dotfiles..."
link_dotfiles

echo "==> Configurando shell..."
set_zsh

echo "==> Configurando discos..."
setup_disks

echo ""
echo "Todo listo. Reinicia sesión para aplicar los cambios."
