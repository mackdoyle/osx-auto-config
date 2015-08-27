#!/bin/bash
# ==================================================================
# Grunt Installation
# ==================================================================
recipe="grunt-cli"
installed_name="grunt"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}


