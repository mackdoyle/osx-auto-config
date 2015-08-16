#!/bin/bash
# ==================================================================
# Vim Setup
# ==================================================================
recipe="Vim"
status=1
echo "Beginning $recipe installation"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."
# Ensure Homebrew is installed before continuing
check_homebrew


# Install Sublime Text
# ---------------------------------------------------------------------
echo "Installing $recipe"
brew_install_recipe ${recipe} # returns install_status=0 or 1
status=${install_status}

# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}

