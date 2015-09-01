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
    brew doctor --quiet >/dev/null
    brew cleanup --quiet >/dev/null
    brew prune --quiet >/dev/null
    brew cask cleanup --quiet >/dev/null
    echo "Brew Cleaned"
  fi

  #if [[ -n $(type rbenv) ]]; then
    #rbenv rehash
   # echo "Ruby Env Cleaned"
  #fi
}

