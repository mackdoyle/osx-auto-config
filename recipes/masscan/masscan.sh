#!/bin/bash
set -o nounset
# ==================================================================
# Masscan Installation
# Network scanner
# ==================================================================
recipe="masscan"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}