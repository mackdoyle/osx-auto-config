#!/bin/bash
# ==================================================================
# OS X Kubernetes-cli Setup
# ==================================================================
recipe="kubernetes-cli"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}


