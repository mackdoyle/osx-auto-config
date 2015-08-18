#!/bin/bash
# ==================================================================
# OS X Bower Installation
# ==================================================================
recipe="bower"
installed_name="bower"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_npm

# Install Recipe
# ------------------------------------------------------------------
npm_install_recipe ${recipe}



