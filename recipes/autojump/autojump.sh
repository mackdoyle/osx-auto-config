#!/bin/bash
# ==================================================================
# OS X Auto Jump Installation
# ==================================================================
recipe="autojump"
installed_name="autojump"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}

