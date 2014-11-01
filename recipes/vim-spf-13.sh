#!/bin/bash
# =====================================================================
# SPF-13 flavor of Vim
# Installs a fresh copy of Vim and additional plugins or adds to existing install of Vim
# =====================================================================

recipe="SPF-13"
installed=0
spfpath=~/.spf13-vim-3
echo "Beginning $recipe installation"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for existing installations..."

# Ensure Homebrew is installed before continuing
type curl >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }

# Check for an existing installation of SPF-13
if [ -d "$spfpath" ]; then
  echo "SPF-13 is already installed. Skipping installation."; exit 1;
fi

# Install SPF-13
# ---------------------------------------------------------------------
if [ -d "$spfpath" ]; then
  echo "Installing $recipe"
  curl http://j.mp/spf13-vim3 -L -o - | sh
  installed=$installed + 1
fi

# Display Installation results
# ---------------------------------------------------------------------
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $installed completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?