#!/bin/bash
# ==================================================================
# OS X MongoDB Installation
# ==================================================================
recipe="mongodb"
installed_name="mongodb"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


