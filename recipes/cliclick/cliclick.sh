#!/bin/bash
# ==================================================================
# Cli-Click Installation
# Mouse clicking in your terminal!
# ==================================================================
recipe="cliclick"
installed_name="cliclick"



# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}


