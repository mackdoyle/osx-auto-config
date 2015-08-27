#!/bin/bash
# ==================================================================
# OS X Yeoman Installation
# ==================================================================
recipe="yeoman"
installed_name="yo"
[[ -z "${DIR}" ]] && DIR=$1



# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_npm

# Install Recipe
# ------------------------------------------------------------------
npm_install_recipe ${recipe}



