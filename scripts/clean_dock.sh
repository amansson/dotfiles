#!/usr/bin/env bash

apps=(
	"Google Chrome"
    iTerm
	"Visual Studio Code"
    Insomnia
	Slack
	Spotify
    "Microsoft Outlook"
    "Microsoft Teams"
)

# Remove all apps from Dock
dockutil --no-restart --remove all

# Add all my apps to the Dock
for app in "${apps[@]}"
do
	dockutil --add "/Applications/${app}.app" --no-restart
done

killall Dock
