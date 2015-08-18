#!/bin/bash
# ==================================================================
# Dash Installation
# Quick access to official documentation
# ==================================================================
recipe="dash"
installed_name="Dash"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


