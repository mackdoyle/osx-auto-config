#!/bin/bash
# ==================================================================
# Jekyll Installation
# Ruby based static website generator
# ==================================================================
recipe="jekyll"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_gem

# Install Recipe
# ------------------------------------------------------------------
gem_install_recipe ${recipe}