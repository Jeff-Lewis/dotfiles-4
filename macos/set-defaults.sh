# Sets reasonable macOS defaults.
#
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#

# Run ./set-defaults.sh and you'll be good to go.

set -e

source ./script/common.sh

# ------------ DISPLAY -------------------------
info 'DISPLAY SETTINGS'

info 'Enable sub-pixel rendering on non-Apple displays.'
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# ------------ SYSTEM --------------------------
info 'SYSTEM SETTINGS'

info 'Disable auto-correct.'
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

info 'Disable animations for windows.'
defaults write com.apple.finder DisableAllAnimations -bool true

info 'Screensaver always asks for password.'
defaults write com.apple.screensaver askForPassword -int 1

info 'Reset launchpad.'
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm ~/Library/Application\ Support/Dock/*.db

# ------------ FINDER --------------------------
info 'FINDER SETTINGS'

info 'Always open finder in list view.'
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

info 'Do not hide the ~/Library folder.'
chflags nohidden ~/Library

info 'Always show file extensions.'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

info 'Show the status bar at the bottom of finder windows.'
defaults write com.apple.finder ShowStatusBar -bool true

info 'Always securely delete the trash'
defaults write com.apple.finder EmptyTrashSecurely -bool true

info 'Use full path as finder window title.'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

info 'Disable disk image validation.'
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

info 'Show external drives and volumes on the desktop.'
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

info 'Enable Airdrop on all interfaces.'
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

info 'Disable resume system-wide.'
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# ------------- HOT CORNERS --------------------
info 'DESKTOP SETTINGS'

info 'Turn on the screen saver when mouse is at bottom left of display.'
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# ------------- SAFARI -------------------------
info 'SAFARI SETTINGS'

info 'Hide Safari bookmark bar by default.'
defaults write com.apple.Safari ShowFavoritesBar -bool false

info 'Enable development features in Safari.'
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

info 'Disable thumbnails for last and most visited sites.'
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

info 'Enable debug window.'
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true


