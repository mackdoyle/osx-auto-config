#!/bin/bash
# ==================================================================
# Emacs Installation
# ==================================================================
recipe="emacs"
installed_name="emacs"
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


