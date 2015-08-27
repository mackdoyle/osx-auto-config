#!/bin/bash
# ==================================================================
# Core Utilities Installation
# Installs later version of core utilities than what come on OS X by default
# ==================================================================
recipe="coreutils"
installed_name="coreutils"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


