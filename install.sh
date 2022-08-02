#!/usr/bin/env bash

# Installing core apps and tweaks
chmod +x scripts/*.sh

scripts/install_brew.sh
scripts/clean_dock.sh
scripts/osx_tweaks.sh

echo "${green}All done!${normal}" | indent
