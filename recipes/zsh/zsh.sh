#!/bin/bash
# ==================================================================
# OS X Zsh Setup
# ==================================================================
recipe="zsh"
installed_name="zsh"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 or 1



