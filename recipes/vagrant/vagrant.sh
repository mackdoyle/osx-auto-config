#!/bin/bash
# ==================================================================
# OS X Vagrant Setup
# ==================================================================
recipe="vagrant"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${recipe}

