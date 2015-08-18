#!/bin/bash
set -o nounset
# ==================================================================
# Parker Setup
# Stylesheet analysis tool. It runs metrics on your stylesheets and 
# reports on their complexity.
# ==================================================================
recipe="parker"
[[ -z "${DIR}" ]] && DIR=$1
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
source ${DIR}/lib/dependency_check.sh
check_node
echo "Prerequisite check complete."

# Install Recipe
# ------------------------------------------------------------------
npm install -g parker
status=0
# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}





