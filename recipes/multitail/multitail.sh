#!/bin/bash
# ==================================================================
# multitail Installation
# Enhanced log tailing
# ==================================================================
recipe="multitail"
installed_name="multitail"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


