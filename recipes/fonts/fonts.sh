#!/bin/bash
# ==================================================================
# OS X Custom Fonts
# ==================================================================

# Check for existing installations
# ---------------------------------------------------------------------
check_homebrew_cask

# Tap the Cask fonts repo
brew tap caskroom/fonts

# Install Fonts
# -----------------------------------------------------------------------------------------------------------------------------------
brew cask install font-anonymous-pro
brew cask install font-anonymous-pro-for-powerline
brew cask install font-dejavu-sans-mono-for-powerline
brew cask install font-droid-sans-mono-for-powerline
brew cask install font-fira-mono-for-powerline
brew cask install font-inconsolata
brew cask install font-inconsolata-for-powerline
brew cask install font-inconsolata-dz-for-powerline 
brew cask install font-inconsolata-g-for-powerline
brew cask install font-liberation-mono-for-powerline
brew cask install font-meslo-lg-for-powerline
brew cask install font-monoid
brew cask install font-monoone
brew cask install font-sauce-code-powerline
brew cask install font-source-code-pro-for-powerline
brew cask install font-ubuntu-mono-powerline

# Extra - Design Fonts
brew cask install font-comfortaa
