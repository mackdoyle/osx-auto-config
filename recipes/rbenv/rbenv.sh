#!/bin/bash
# ==================================================================
# RubyEnv Installation
# ==================================================================
recipe="rbenv"
installed_name="ruby-build"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${installed_name}
brew_install_recipe "ruby-build" ${installed_name}
