#!/bin/bash
set -o nounset
# ==================================================================
# CTail Setup
# Tail logs across multiple clustered servers
# ==================================================================
recipe="ctail"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


