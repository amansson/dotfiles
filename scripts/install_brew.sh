#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo
fi

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
