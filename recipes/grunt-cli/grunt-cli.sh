#!/bin/bash
# ==================================================================
# Grunt Installation
# ==================================================================
recipe="grunt-cli"
installed_name="grunt"

# Check for existing installations
# ------------------------------------------------------------------
check_npm

# Install Recipe
# ------------------------------------------------------------------
node_install_recipe ${recipe} ${installed_name}
