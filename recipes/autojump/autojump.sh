#!/bin/bash
set -o nounset
# ==================================================================
# OS X Vagrant Setup
# ==================================================================
recipe="autojump"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)
status=${install_status}

# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}

