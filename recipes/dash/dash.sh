#!/bin/bash
# ==================================================================
# Dash Installation
# Quick access to official documentation
# ==================================================================
recipe="dash"
installed_name="Dash"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}


