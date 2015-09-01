#!/bin/bash
# ==================================================================
# OS X Kubernetes-cli Setup
# ==================================================================
recipe="kubernetes-cli"
installed_name="kubernetes"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


