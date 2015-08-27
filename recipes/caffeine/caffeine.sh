#!/bin/bash
# ==================================================================
# caffeine Installation
# Keep your mack awake with the lid closed
# ==================================================================
recipe="caffeine"
installed_name="Caffeine"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}


