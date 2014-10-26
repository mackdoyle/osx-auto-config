#!/bin/bash
# ==================================================================
# Vagrant
# ==================================================================
recipe="Vagrant"
prereq1="Virttualbox"
completed=0
echo "Beginning $recipe installation"

# Install Dependencies
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."

# Ensure Homebrew is installed before continuing
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }


# Install Recipes
# ---------------------------------------------------------------------
# Virtualbox
if test ! $(which virtualbox) then
  echo "Installing $prereq1"
  brew cask install virtualbox
fi

# Vagrant
if test ! $(which vagrant) then
  echo "Installing $recipe"
  brew cask install vagrant
  completed="1"
fi


# Display Installation results
# ---------------------------------------------------------------------
if [[ "$completed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $prereq1 and $recipe completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?