#!/usr/bin/env bash

set -euo pipefail

# Symlink dotfiles configs and set fish as the default shell
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Linking config files"

mkdir -p ~/.config/fish ~/.config/ghostty "$HOME/Library/Application Support/Code/User"
ln -sf "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config
ln -sf "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml
if [ -e ~/.gitconfig ] && [ ! -L ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.gitconfig.backup
fi
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

CODE_PATH="$(command -v code || true)"
if [ -z "$CODE_PATH" ] && [ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
  CODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
fi
if [ -n "$CODE_PATH" ]; then
  "$CODE_PATH" --install-extension biomejs.biome --force
  "$CODE_PATH" --install-extension PKief.material-icon-theme --force
else
  echo "Visual Studio Code CLI not found; skipping extension installation."
fi

FISH_PATH="$(command -v fish)"

if [ -n "$FISH_PATH" ]; then
  if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "Adding fish to list of allowed shells."
    sudo sh -c "echo $FISH_PATH >> /etc/shells"
  fi

  if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "Setting fish as the default shell."
    chsh -s "$FISH_PATH"
  fi
fi

echo "Config files linked"
