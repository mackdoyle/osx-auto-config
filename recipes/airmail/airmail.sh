#!/bin/bash
# ==================================================================
# OS X Airmail Installation
# ==================================================================
recipe="airmail-amt"
installed_name="Airmail"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}
