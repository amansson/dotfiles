#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Installing core apps and tweaks
chmod +x "$DOTFILES_DIR/scripts"/*.sh

"$DOTFILES_DIR/scripts/install_brew.sh"
"$DOTFILES_DIR/scripts/link_configs.sh"
"$DOTFILES_DIR/scripts/clean_dock.sh"
"$DOTFILES_DIR/scripts/osx_tweaks.sh"

echo "All done! Restart your terminal (or open Ghostty) to use fish."
