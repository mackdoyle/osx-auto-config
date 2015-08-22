#!/bin/bash
# ==================================================================
# Vim Installation
# ==================================================================
recipe="vim"
echo "Beginning $recipe installation"

# Check for existing installations
# ---------------------------------------------------------------------
check_homebrew

# Install Sublime Text
# ---------------------------------------------------------------------
echo "Installing $recipe"
brew_install_recipe ${recipe}
