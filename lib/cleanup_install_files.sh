#!/bin/bash
set -o nounset
# ==================================================================
# Cleanup Install Files
# Cleanup files left by installer programs
# ==================================================================

# Check for Virtualbox
# ----------------------------------------------------------------------
cleanup_install_files() {
  brew doctor && brew cleanup && brew prune
}

