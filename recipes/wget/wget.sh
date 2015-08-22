#!/bin/bash
# ==================================================================
# OS X wget Installation
# Utility for non-interactive download of files from the Web.
# ==================================================================
recipe="wget"
installed_name="wget"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 or 1
