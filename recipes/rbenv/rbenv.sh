#!/bin/bash
# ==================================================================
# RubyEnv Installation
# ==================================================================
recipe="rbenv ruby-build"
recipe="rbenv"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}
