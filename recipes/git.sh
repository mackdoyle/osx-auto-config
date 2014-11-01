#!/bin/bash
# =====================================================================
# Git Setup
# =====================================================================

recipe="Git"
installed=0
echo "Beginning $recipe installation"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for existing installations..."

# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Install iTerm2
# ---------------------------------------------------------------------
if test ! $(which git) then
  echo "Installing $recipe"
  brew install git
  installed=$installed + 1 
fi

# Configure git identity, aliases, and other settings.
#@TODO: prompt user for settings
#git config --global user.name ""
#git config --global user.email ""
#git config --list


# Display Installation results
# ---------------------------------------------------------------------
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $installed completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?






