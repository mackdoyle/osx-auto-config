#!/bin/bash
# =====================================================================
# SPF-13 flavor of Vim for OS X Installation
# =====================================================================
recipe="SPF-13"
status=1

recipe_check="$(find ~ | grep -i "spf")"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for existing installations..."

# Ensure Vim is installed before continuing
type vim >/dev/null 2>&1 || { echo >&2 "Vim not found. Attempting to install it for you"; source $(DIR)/recipes/vim/vim.sh; }


# Install SPF-13
# ---------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
  echo "Installing ${recipe}"
  curl http://j.mp/spf13-vim3 -L -o - | sh
  status=0
fi

# Display Installation results
# ---------------------------------------------------------------------
show_results ${recipe} ${status}
