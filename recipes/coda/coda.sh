#!/bin/bash
# ==================================================================
# Coda Installation
# Panic's IDE
# ==================================================================
recipe="coda"
installed_name="Coda 2"



# Install Dependencies
# ------------------------------------------------------------------
check_homebrew_cask

# Install Recipe
# ------------------------------------------------------------------
brew_cask_install_recipe  ${recipe}
