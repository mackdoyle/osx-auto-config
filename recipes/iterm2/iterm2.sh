#!/bin/bash
# ==================================================================
# OS X iTerm2 Setup
# ==================================================================
recipe="iterm2"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}


