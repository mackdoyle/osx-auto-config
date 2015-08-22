#!/bin/bash
# ==================================================================
# OS X BFG Installation
# Alternative to git-filter-branch for cleansing bad data out of 
# your Git repository history
# ==================================================================
recipe="bfg"
installed_name="bfg"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 or 1
