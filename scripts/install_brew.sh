#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo "Installing Brew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo
fi

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

echo "Brew installed"
echo
echo
echo "Start installing Brew apps"

brew update
brew bundle
brew cleanup -s

echo
echo "Brew apps finished installing"
