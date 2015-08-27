#!/bin/bash
# ==================================================================
# Google Chrome Installation
# ==================================================================
recipe="google-chrome"
installed_name="Google Chrome"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}


