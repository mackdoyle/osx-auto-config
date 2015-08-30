#!/bin/bash
# ==================================================================
# multitail Installation
# Enhanced log tailing
# ==================================================================
recipe="multitail"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)


