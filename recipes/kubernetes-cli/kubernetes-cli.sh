#!/bin/bash
# ==================================================================
# OS X Kubernetes-cli Setup
# ==================================================================
recipe="kubernetes-cli"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}


