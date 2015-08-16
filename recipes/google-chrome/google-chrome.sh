#!/bin/bash
# =====================================================================
# Google Chrome Setup
# =====================================================================

recipe="Google Chrome"
status=1
echo "Beginning $recipe installation"

# Check for existing installations and prerequisites
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."

# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Chrome
# ---------------------------------------------------------------------
brew cask install google-chrome
status=$status + 1

# Firefox
# ---------------------------------------------------------------------
brew cask install firefox
status=$status + 1

# Display Installation results
# ---------------------------------------------------------------------
if [[ $status > 0 ]]; then
  echo "$(tput setaf 165)Installation of $recipe status successfully.$(tput sgr 0)"
fi
#etc.

exit $?