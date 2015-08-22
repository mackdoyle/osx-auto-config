#!/bin/bash
# ==================================================================
# OS X Virtualbox Installation
# ==================================================================
recipe="virtualbox"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}


