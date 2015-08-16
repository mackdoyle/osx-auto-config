#!/bin/bash
set -o nounset
# ==================================================================
# Bower Installation
# ==================================================================

# Check for existing installations
# ------------------------------------------------------------------
recipe="yeoman"
installed_name="yo"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
# Ensure Homebrew is installed before continuing
check_npm
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
npm_install_recipe ${recipe} # returns install_status=0 or 1

#etc.