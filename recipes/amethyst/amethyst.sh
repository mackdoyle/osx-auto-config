#!/bin/bash
# ==================================================================
# OS X Amethyst Installation
# Window Manager with support for focus on mouse home ala classic x-wondows
# ==================================================================
recipe="amethyst"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}


