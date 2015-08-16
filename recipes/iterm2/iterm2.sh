#!/bin/bash
# =====================================================================
# iTerm2 Setup
# =====================================================================

recipe="iTerm2"
installed=0
echo "Beginning $recipe installation"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for existing installations..."

# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Install iTerm2
# ---------------------------------------------------------------------
if test ! $(which iterm2) then
  echo "Installing $recipe"
  brew cask install iterm2
  installed=$installed + 1 
fi


# Display Installation results
# ---------------------------------------------------------------------
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $installed status successfully.$(tput sgr 0)"
fi
#etc.

exit $?