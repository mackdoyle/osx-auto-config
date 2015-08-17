#!/bin/bash
# ==================================================================
# OS X Alfred Installation
# ==================================================================
recipe="alfred"
installed_name="Alfred 2"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe}
