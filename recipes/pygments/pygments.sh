#!/bin/bash

# Pygments  - Code syntax highlighting
# pygment.org
# ###############################################################################

recipe="Pygments"
installed=""

# Check for existing installations
# ###############################################################################
echo "Beginning $recipe installation"
echo "Checking for prerequisites..."
ynPYGMENTS=$(type pygmentize)

# Check for easy_install. If not found redirect to the Python recipe which will runa routine that includes it.
type easy_install >/dev/null 2>&1 || { echo >&2 "Easy Install not found. Attempting to install it for you"; bash $(DIR)/scripts/python.sh; }


# Install Recipe
# ###############################################################################
if [[ "$ynPYGMENTS" != "" ]]; then
  echo "Installing $recipe"
  easy_install Pygments==dev
  installed="1"
fi


# Display Installation results
# ###############################################################################
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $recipe status successfully.$(tput sgr 0)"
fi
