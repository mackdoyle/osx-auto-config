#!/bin/bash
# ==================================================================
# Git Installation
# ==================================================================
recipe="git"
installed_name="git"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


