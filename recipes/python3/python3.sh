#!/bin/bash
# ==================================================================
# Python3 Installation
# ==================================================================
recipe="python3"
installed_name="python3"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


