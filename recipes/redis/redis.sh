#!/bin/bash
set -o nounset
# ==================================================================
# OS X Redis Setup
# ==================================================================

# Check for existing installations
# ------------------------------------------------------------------
recipe="redis"
installed_name="redis-server"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh

# Ensure Homebrew is installed before continuing
check_homebrew
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name} # returns install_status=0 or 1


