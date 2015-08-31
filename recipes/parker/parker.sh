#!/bin/bash
# ==================================================================
# Parker Installation
# Stylesheet analysis tool. It runs metrics on your stylesheets and 
# reports on their complexity.
# ==================================================================
recipe="parker"


# Check for existing installations
# ------------------------------------------------------------------
check_npm

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} ${recipe}





