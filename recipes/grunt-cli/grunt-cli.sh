#!/bin/bash
# ==================================================================
# Grunt Installation
# ==================================================================
recipe="grunt-cli"
installed_name="grunt"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
check_node

# Install Recipe
# ------------------------------------------------------------------
node_install_recipe ${recipe}


