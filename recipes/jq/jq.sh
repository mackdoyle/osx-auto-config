#!/bin/bash
# ==================================================================
# OS X ./jq Installation
# Formatting, colorizing and powerful filtering of JSON responses
# https://stedolan.github.io/jq/
# ==================================================================
recipe="jq"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe}


