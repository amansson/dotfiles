#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo "Installing Brew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo
fi

echo "Adding Brew to PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
echo

# Get Brew directory
BREW_PREFIX=$(brew --prefix)

  # Fix permissions for Zsh compaudit
chmod go-w $BREW_PREFIX/share

# Ensure Brew Zsh is a valid shell option
if ! cat /etc/shells | grep $BREW_PREFIX/bin/zsh > /dev/null; then
  echo "Adding Brew Zsh to list of allowed shells."
  sudo sh -c 'echo ${BREW_PREFIX}/bin/zsh >> /etc/shells'
  echo
fi

# Ensure Brew Bash is a valid shell option
if ! cat /etc/shells | grep $BREW_PREFIX/bin/bash > /dev/null; then
  echo "Adding Brew Bash to list of allowed shells."
  sudo sh -c 'echo ${BREW_PREFIX}/bin/bash >> /etc/shells'
  echo
fi

echo "Brew installed"
echo
echo
echo "Start installing Brew apps ..."

brew update
brew bundle
brew cleanup -s

echo
echo "Brew apps finished installing"
