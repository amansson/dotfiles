#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

if [ "$(uname -m)" != "arm64" ]; then
  echo "This setup supports Apple Silicon Macs only."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Brew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ ! -x /opt/homebrew/bin/brew ]; then
    echo "Homebrew installation did not create /opt/homebrew/bin/brew."
    echo "Check the installer output above and confirm Xcode Command Line Tools are installed."
    exit 1
  fi
  echo
fi

echo "Adding Brew to PATH"
echo

echo "Brew installed"
echo
echo
echo "Start installing Brew apps ..."

attempt=1
until brew update && brew bundle --file="$DOTFILES_DIR/brewfile"; do
  if [ "$attempt" -ge 3 ]; then
    echo "Homebrew setup failed after 3 attempts."
    exit 1
  fi
  attempt=$((attempt + 1))
  echo "Homebrew setup failed; retrying (attempt $attempt/3)."
done

brew cleanup -s

echo
echo "Brew apps finished installing"
