#!/bin/bash
# ==================================================================
# Vim Setup
# ==================================================================
recipe="Vim"
completed=0
echo "Beginning $recipe installation"


# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."
# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }


# Install Sublime Text
# ---------------------------------------------------------------------
echo "Installing $recipe"
brew install vim
completed=$completed+1

# Display Installation results
# ---------------------------------------------------------------------
if [[ "$completed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $recipe completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?

