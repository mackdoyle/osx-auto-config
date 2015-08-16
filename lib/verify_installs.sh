#!/bin/bash
set -o nounset
# ==================================================================
# Verify Installations
# Helpers for verifying some types of installations
# ==================================================================


# Verify Homebrew installations
# ----------------------------------------------------------------------
verify_brew_installs() {
  local app_name=$1
  
  # If the app has a cli, try an execute a test command
  
}

# Verify Homebrew Cask Installations
# ----------------------------------------------------------------------
verify_brew_cask_installs() {
  local app_name=$1
  
  # First Check to see if it has a sym-link in /Applications

  # If not, check to see if it is in the Caskroom (/opt/homebrew-cask/Caskroom)

  # If one of the above passes and the app has a cli, try an execute a test command
  
}


