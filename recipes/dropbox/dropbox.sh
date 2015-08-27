#!/bin/bash
# ==================================================================
# Dropbox Installation
# Remote file storage
# ==================================================================
recipe="dropbox"
installed_name="Dropbox"


# Check for existing installations
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe ${recipe} ${installed_name}


