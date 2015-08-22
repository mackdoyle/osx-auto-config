#!/bin/bash
set -o nounset
# ==================================================================
# Cleanup Install Files
# Cleanup files left by installer programs
# ==================================================================

# Check for Virtualbox
# ----------------------------------------------------------------------
cleanup_install_files() {
  if [[ -n $(type brew) ]]; then
    brew doctor >/dev/null
    brew cleanup >/dev/null
    brew prune >/dev/null
    brew cask cleanup >/dev/null
    echo "Brew Cleaned"
  fi

  #if [[ -n $(type rbenv) ]]; then
    #rbenv rehash
   # echo "Ruby Env Cleaned"
  #fi
}

