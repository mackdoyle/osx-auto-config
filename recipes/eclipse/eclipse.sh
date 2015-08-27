#!/bin/bash
# ==================================================================
# Eclipse Installation
# Another open source IDE
# ==================================================================
recipe="eclipse-ide"
installed_name="Eclipse"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}


