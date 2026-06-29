#!/bin/bash
# Instala los dotfiles en el home del usuario actual

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

echo "Instalando dotfiles desde $DOTFILES_DIR..."

# Archivos del home
for file in .zshrc .gitconfig .npmrc .bash_profile .bashrc; do
  if [ -f "$DOTFILES_DIR/$file" ]; then
    ln -sf "$DOTFILES_DIR/$file" "$HOME_DIR/$file"
    echo "  -> $file"
  fi
done

# Directorios de .config
mkdir -p "$HOME_DIR/.config"
for dir in "$DOTFILES_DIR"/.config/*/; do
  name=$(basename "$dir")
  ln -sfn "$dir" "$HOME_DIR/.config/$name"
  echo "  -> .config/$name"
done

echo "Listo."
