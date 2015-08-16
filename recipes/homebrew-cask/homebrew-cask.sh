#!/bin/bash
set -o nounset
# ==================================================================
# Homebrew Cask Setup
# ==================================================================
recipe="cask"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_homebrew
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
status=0
# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}





