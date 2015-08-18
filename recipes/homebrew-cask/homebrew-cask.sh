#!/bin/bash
# ==================================================================
# Homebrew Cask Installation
# ==================================================================
recipe="cask"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew


# Install Recipe
# ------------------------------------------------------------------
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions






