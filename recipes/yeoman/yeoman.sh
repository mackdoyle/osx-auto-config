#!/bin/bash
# ==================================================================
# OS X Yeoman Installation
# ==================================================================
recipe="yo"
installed_name="yo"

# Check for existing installations
# ------------------------------------------------------------------
check_npm

# Install Recipe
# ------------------------------------------------------------------
npm_install_recipe ${recipe} ${installed_name}



