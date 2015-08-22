#!/bin/bash
# ==================================================================
# OS X MySQL Installation
# ==================================================================
recipe="mysql"
installed_name="mysql"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name} 


