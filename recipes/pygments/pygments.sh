#!/bin/bash
# ==================================================================
# Pygments Installation
# Code Syntax Highlighting - pygments.org
# ==================================================================
recipe="pygments"
installed_name="pygmentize"

# Check for existing installations
# ------------------------------------------------------------------
check_easy_install

# Install Recipe
# ------------------------------------------------------------------
# easy_install Pygments==dev
easy_install_recipe ${recipe} ${installed_name}
