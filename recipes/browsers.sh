#!/bin/bash
# =====================================================================
# Browsers Setup
# =====================================================================

recipe="Chrome and Firefox"
completed=0
echo "Beginning $recipe installation"

# Check for existing installations and prerequisites
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."

# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Chrome
# ---------------------------------------------------------------------
brew cask install google-chrome
completed=$completed + 1

# Firefox
# ---------------------------------------------------------------------
brew cask install firefox
completed=$completed + 1

# Display Installation results
# ---------------------------------------------------------------------
if [[ "$completed" > 0 ]]; then
  echo "$(tput setaf 165)Installation of $recipe completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?