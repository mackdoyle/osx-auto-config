#!/bin/bash
# ==================================================================
# OS X Redis Installation
# ==================================================================
recipe="redis"
installed_name="redis-server"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


