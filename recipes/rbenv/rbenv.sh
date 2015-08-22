#!/bin/bash
# ==================================================================
# RubyEnv Installation
# ==================================================================
recipe="rbenv ruby-build"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Install Recipe
brew install rbenv ruby-build

# Make sure PATH Exists for now
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi  

# Install a version of Ruby using Rubenv and make it default
rbenv install 2.1.3
rbenv global 2.1.3


