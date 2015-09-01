#!/bin/bash
# ==================================================================
# Python Extras Installation
# ==================================================================
recipe="python-extras"


# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${recipe}


