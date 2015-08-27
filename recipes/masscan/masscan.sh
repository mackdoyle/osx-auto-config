#!/bin/bash
set -o nounset
# ==================================================================
# Masscan Installation
# Network scanner
# ==================================================================
recipe="masscan"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}