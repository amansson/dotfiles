#!/usr/bin/env bash

set -euo pipefail

apps=(
	"Brave Browser"
    Ghostty
	"Visual Studio Code"
	Slack
	Spotify
)

# Remove all apps from Dock
dockutil --no-restart --remove all

# Add all my apps to the Dock
for app in "${apps[@]}"
do
	if [ -d "/Applications/${app}.app" ]; then
		dockutil --add "/Applications/${app}.app" --no-restart
	else
		echo "Skipping missing app: ${app}"
	fi
done

killall Dock
