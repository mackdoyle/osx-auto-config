#!/bin/bash
# ==================================================================
# We have lift off!
# This is the master file that first installs any needed dependencies and begins to install and configure 
# ==================================================================

echo "Welcome to the OSX Mavericks provisioning tool. Get ready to feel like a pimp!"

# Allow the recipes to be found in relation to where the ignition.sh script was executed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for prerequisites..."

# Ensure the GCC Compiler is installed as a first step before continuing
type gcc >/dev/null 2>&1 || { echo >&2 "GCC Compiler not found.  Attempting to install it for you"; bash $(DIR)/recipes/xcode-cli.sh; }

# Required Recipes
# ---------------------------------------------------------------------
# Install the package managers needed to download and manage everything
bash ${DIR}/recipes/homebrew.sh
bash ${DIR}/recipes/homebrew-cask.sh
bash ${DIR}/recipes/essential.sh

# Optional Recipes
# ---------------------------------------------------------------------
# Core Services
bash ${DIR}/recipes/pygments.sh
bash ${DIR}/recipes/git.sh
bash ${DIR}/recipes/jshint.sh

# Terminal and Shell
bash ${DIR}/recipes/iterm2.sh
bash ${DIR}/recipes/zsh.sh
bash ${DIR}/recipes/omzsh.sh
bash ${DIR}/recipes/zsh-highlighting.sh
bash ${DIR}/recipes/zsh-completions.sh

# Programming Languages
bash ${DIR}/recipes/python.sh
bash ${DIR}/recipes/python-extra.sh
bash ${DIR}/recipes/golang.sh
bash ${DIR}/recipes/node.sh
bash ${DIR}/recipes/ruby.sh
bash ${DIR}/recipes/sass.sh

# Development Software/Tools
bash ${DIR}/recipes/browsers.sh
# bash ${DIR}/recipes/emacs.sh
bash ${DIR}/recipes/coda.sh
bash ${DIR}/recipes/sublime-text.sh
bash ${DIR}/recipes/text-wrangler.sh
bash ${DIR}/recipes/vim.sh

# Network
bash ${DIR}/recipes/masscan.sh

# File System
bash ${DIR}/recipes/dropbox.sh
bash ${DIR}/recipes/file-compression.sh

# Virtualization
bash ${DIR}/recipes/vagrant.sh

# Mods
#bash ${DIR}/recipes/spf-13.sh

# Cleanup any messes we left behind
# ---------------------------------------------------------------------
bash ${DIR}/recipes/cleanup.sh

exit $?