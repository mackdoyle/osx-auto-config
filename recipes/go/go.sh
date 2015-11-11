#!/bin/bash
# ==================================================================
# Go Installation
# ==================================================================
recipe="go"
installed_name="go"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
# ------------------------------------------------------------------
brew_install_recipe ${recipe} # returns install_status=0 (Success) or 1 (Fail)

# Extras
# ------------------------------------------------------------------
go get golang.org/x/tools/cmd/godoc
go get golang.org/x/tools/cmd/vet
