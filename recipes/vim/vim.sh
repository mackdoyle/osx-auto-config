#!/bin/bash
# ==================================================================
# Vim Installation
# ==================================================================
recipe="vim"

# Check for existing installations
# ---------------------------------------------------------------------
check_homebrew

# Install Sublime Text
# ---------------------------------------------------------------------
brew_install_recipe ${recipe} ${recipe}
