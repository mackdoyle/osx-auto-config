#!/bin/bash
# ==================================================================
# OS X Homebrew Setup
# ==================================================================
echo "Beginning Homebew installation"
completed=0

# Check for existing installations
# -----------------------------------------------------------------------------------------------------------------------------------
echo "Checking for prerequisites..."

# Ensure xCode is installed before continuing
type gcc >/dev/null 2>&1 || { echo >&2 "GCC Compiler (Xcode CLT) not found.  Attempting to install it for you"; bash $(DIR)/scripts/xcode-cli.sh; }


# Install Homebrew 
# -----------------------------------------------------------------------------------------------------------------------------------
if test ! $(which brew) then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

##
# TODO: move these into individual Bash and Zsh config scripts.
##

# Create basic configuration needed to use Homebrew
if test ! $(which bash) then
  echo -e "\n# Add path to homebrew bin." >> ${HOME}/.bash_profile
  echo "PATH=/usr/local/bin:\$PATH" >> ${HOME}/.bash_profile
  echo -e "\n# Add homebrew tab completion to bash." >> ${HOME}/.bashrc
  echo "source `brew --repository`/Library/Contributions/brew_bash_completion.sh" >> ${HOME}/.bashrc
fi

# Also add basic Homebrew configuration to Zsh if it exists
if test ! $(which zsh) then
  echo -e "\n# Add path to homebrew bin." >> ${HOME}/.bash_profile
  echo "PATH=/usr/local/bin:\$PATH" >> ${HOME}/.bash_profile
  echo -e "\n# Add homebrew tab completion to bash." >> ${HOME}/.bashrc
  echo "source `brew --repository`/Library/Contributions/brew_bash_completion.sh" >> ${HOME}/.bashrc
fi


# Tap the main repositories
# -----------------------------------------------------------------------------------------------------------------------------------
brew tap homebrew/dupes; brew tap homebrew/versions; brew tap homebrew/homebrew-php;
brew cleanup
exit $?