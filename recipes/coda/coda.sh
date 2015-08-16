#!/bin/bash
set -o nounset
# ==================================================================
# Coda Setup
# ==================================================================
recipe="coda"
status=1
echo "Beginning $recipe installation"
recipe_check="$(mdfind kMDItemContentTypeTree=com.apple.application-bundle -onlyin /Applications | grep -i "${recipe}.*.app")"

# Install Dependencies
# ------------------------------------------------------------------
echo "Checking for prerequisites..."
source ${DIR}/lib/dependency_check.sh

# Ensure Homebrew Cask, and its prereqs, are installed before continuing
check_homebrew_cask


# Install Recipe
# ------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
  echo "Installing ${recipe}"
  brew_cask_install_recipe  ${recipe} # returns install_status=0 or 1
  status=${install_status}
fi

# Display Installation results
# ------------------------------------------------------------------
# @params $recipe $status
show_results ${recipe} ${status}
