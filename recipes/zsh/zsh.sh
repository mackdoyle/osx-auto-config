#!/bin/bash
# ==================================================================
# OS X Zsh Setup
# ==================================================================
recipe="zsh"
installed_name="zsh"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 or 1

