#!/bin/bash
# ==================================================================
# OS X Custom Fonts
# ==================================================================

# Check for existing installations
# -----------------------------------------------------------------------------------------------------------------------------------
# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Tap the Cask fonts repo
brew tap caskroom/fonts

# Install Fonts
# -----------------------------------------------------------------------------------------------------------------------------------
brew cask install font-anonymous-pro-for-powerline
brew cask install font-inconsolata

brew cask cleanup       # Cleans up caches from installation

exit $?