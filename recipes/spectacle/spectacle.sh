#!/bin/bash
# ==================================================================
# OS X Spectacle Installation
# Window mgt tool
# ==================================================================
recipe="spectacle"
installed_name="Spectacle"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}
