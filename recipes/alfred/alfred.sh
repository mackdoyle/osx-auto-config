#!/bin/bash
# ==================================================================
# OS X Alfred Installation
# ==================================================================
recipe="alfred"
installed_name="Alfred 2"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}
