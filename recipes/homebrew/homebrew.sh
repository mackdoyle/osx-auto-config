#!/bin/bash
set -o nounset
# ==================================================================
# OS X Homebrew Setup
# ==================================================================
echo "Beginning Homebew installation"
recipe="homebrew"
installed_name="brew"
status=1
[[ -z "${DIR}" ]] && DIR=$1

# Check for existing installations
# ------------------------------------------------------------------
# Ensure xCode is installed before continuing
check_xcode

# Install Homebrew 
# ------------------------------------------------------------------
if test ! "$(which brew)"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install some Homebrew essentials while we are at it
  brew install bash-completion
  brew install bash-git-prompt

  status=0
fi

# Tap the main repositories
# ------------------------------------------------------------------
brew tap homebrew/dupes; brew tap homebrew/versions;
brew cleanup

# Display Installation results
# ------------------------------------------------------------------
show_results ${recipe} ${status}

