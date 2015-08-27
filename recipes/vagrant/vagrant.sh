#!/bin/bash
set -o nounset
# ==================================================================
# OS X Vagrant Setup
# ==================================================================
recipe="vagrant"
installed_anme="vagrant"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew_cask
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}

