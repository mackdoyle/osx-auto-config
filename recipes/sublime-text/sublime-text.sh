#!/bin/bash
# ==================================================================
# OS X Sublime Text Installation
# ==================================================================
recipe="sublime-text"
installed_name="Sublime Text"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}
