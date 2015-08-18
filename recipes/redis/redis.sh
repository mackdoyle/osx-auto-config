#!/bin/bash
# ==================================================================
# OS X Redis Installation
# ==================================================================
recipe="redis"
installed_name="redis-server"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


