#!/bin/bash
set -o nounset
# ==================================================================
# Coda Setup
# ==================================================================
recipe="dash"
status=1
echo "Beginning $recipe installation"
recipe_check="$(mdfind kMDItemContentTypeTree=com.apple.application-bundle -onlyin /Applications | grep -i "Dash..app")"

# Install Dependencies
# ------------------------------------------------------------------
echo "Checking for prerequisites..."
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
  echo "Installing ${recipe}"
  brew_cask_install_recipe  ${recipe} # returns install_status=0 or 1
  status=${install_status}
fi

# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}