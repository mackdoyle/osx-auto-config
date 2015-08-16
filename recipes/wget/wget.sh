#!/bin/bash
set -o nounset
# ==================================================================
# OS X wget Setup
# ==================================================================

# Check for existing installations
# ------------------------------------------------------------------
recipe="wget"
status=1
echo "Beginning $recipe installation"
recipe_check="$(type wget)"

# Check for existing installations
# ------------------------------------------------------------------
echo "Checking for prerequisites..."
source $(DIR)/lib/dependency_check.sh

# Ensure Homebrew is installed before continuing
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
  echo "Installing ${recipe}"
  brew install "${recipe}"
  status=$status+1
fi

# Verify Installation
recipe_check="$(type wget)"
if [[ "${recipe_check}" = "" ]]; then
  echo "" # once refactered to functions, we can call the install again but look out for infinite loops
fi

# Display Installation results
# ------------------------------------------------------------------
# @params $recipe $status
show_results ${recipe} ${status}

exit $?
