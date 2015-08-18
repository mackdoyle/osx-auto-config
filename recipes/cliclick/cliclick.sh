#!/bin/bash
# ==================================================================
# Cli-Click Installation
# Mouse clicking in your terminal!
# ==================================================================
recipe="cliclick"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


