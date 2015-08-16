# OS X Vagrant Setup
# Decide which of these we should include...

#OS X Tweaks

## Enable keyboard access for all controls/modals
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

## Expand the Save panel by default in all applications
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

## Make hidden applications semi-transparent on the dock
defaults write com.apple.dock showhidden -bool true

## Avoid creating DSStore files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## Display the full POSIX path as the Finder window's title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## Disable the warning when you change a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Disable the warning shown before you empty the trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

## Allow Finder to quit (using ⌘Q)
defaults write com.apple.finder QuitMenuItem -bool true

## Show all filename extensions in the finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Expand the Printer panel by default in all applications
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

## Enable airdrop-over-ethernet for bridged networks
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

## Enable sub-pixel rendering even if you don't have a fancy Apple display
defaults write NSGlobalDomain AppleFontSmoothing -int 2

## Empty the trash securely by default (yes, this will be time consuming)
defaults write com.apple.finder EmptyTrashSecurely -bool true

## Reveal the ~/Library folder
chflags nohidden ~/Library

## Increase the window resize speed for Cocoa apps
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

## Require password immediately after sleep or screensaver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

## Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

## Disable OS X press-and-hold keys to increase key repeat rate.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

## Set up a fast key repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 0.02

## Decrease the delay until keys are repeated.
defaults write NSGlobalDomain InitialKeyRepeat -int 12

## Disable autocorrect (srsly.)
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
