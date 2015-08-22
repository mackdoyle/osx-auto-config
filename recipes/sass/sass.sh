#!/bin/bash
# ==================================================================
# Ruby version of Sass
# The best CSS preprocessor, so says me!
# ==================================================================
recipe="sass"
installed_name="sass"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_gem

# Install Recipe
# ------------------------------------------------------------------
gem_install_recipe ${recipe}
