#!/bin/bash
set -o nounset
# ==================================================================
# Masscan Installation
# ==================================================================

# Check for existing installations
# ------------------------------------------------------------------
recipe="masscan"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
# Ensure Homebrew is installed before continuing
check_homebrew
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 or 1

#etc.