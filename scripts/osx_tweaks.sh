#!/usr/bin/env bash

# The source: https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Switch to dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to 1'

###############################################################################
# Finder, screenshot                                                          #
###############################################################################
# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Finder: open everything in list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
## Always open everything in Finder's column view
# defaults write com.apple.Finder FXPreferredViewStyle clmv

# Finder: show the ~/Library folder.
chflags nohidden ~/Library

# Finder: show the /Volumes folder
sudo chflags nohidden /Volumes

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Finder: set prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: display full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Screenshot: create and set location
mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock: hide recent apps
defaults write com.apple.dock show-recents -bool false

# Dock: remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# Dock: remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Dock: automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Hot corners
# Takes effect after restart
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Launchpad
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 11
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Notification Center
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################
# Iterm: don't display the annoying prompt when quitting
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Safari                                                                      #
###############################################################################
# Safari: show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Safari: enable the Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

# Safari: add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Safari: disable AutoFill
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false

# Safari: warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Safari: press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

###############################################################################
# Others                                                                      #
###############################################################################
# Use "old" scroll style
defaults write -g com.apple.swipescrolldirection -bool false

# Key repeat: disable press-and-hold in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable subpixel font rendering on non-Apple LCDs
# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Screensaver: require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "MacOS tweaks. Some of these changes require a logout/restart to take effect."
