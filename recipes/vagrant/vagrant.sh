#!/bin/bash
set -o nounset
# ==================================================================
# OS X Vagrant Setup
# ==================================================================
recipe="vagrant"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew_cask
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)

