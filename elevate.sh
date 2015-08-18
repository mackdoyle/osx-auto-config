#!/bin/bash
#set -x
# ==================================================================
# We have lift off!
# This is the master file that first installs any needed dependencies and begins to install and configure 
# @TODO: Look into Bash Plugin Arch: https://code.google.com/p/b-p-a/
# ==================================================================

# Include Core Settings
# ---------------------------------------------------------------------
source config/init.cfg

# Include Core library files
# ---------------------------------------------------------------------
echo "Loading core library files..."
source "${DIR}/config/lib_loader.sh"
echo "${GREEN}Success.${RESET}"

# Check for existing installations
# ---------------------------------------------------------------------
echo "Checking for core prerequisites..."

# Check for Internet connection
inet_check

# Go ahead and run 'brew update' one time if it is already installed
if test "$(which brew)"; then
  echo "Homebrew installed. Let's go ahead and run ${GREEN}brew update${RESET}'"
  brew update
fi

# Ensure Homebrew and its depencies are installed before continuing
check_essential

echo "${GREEN}Success.${RESET}"

# Begin a sudo session
persist_sudo

# Install Recipes
# ---------------------------------------------------------------------
# @NOTE: Xcode, Homebrew and Cask will be installed automatically, if not already.

# Core Tools
source "${DIR}/recipes/git/git.sh"
source "${DIR}/recipes/pygments/pygments.sh"

# Productivity
source "${DIR}/1password/1password.sh"          # nice Password wallet
source "${DIR}/vlc/vlc.sh"                      # video player that supports many formats
source "${DIR}/caffeine/caffeine.sh"            # keep your mac awake even when the lid closes
source "${DIR}/sip/sip.sh"                      # bad ass color pcker
source "${DIR}/moom/moom.sh"                    # window manager
source "${DIR}/alfred/alfred.sh"                # productivity, quick launch
source "${DIR}/dash/dash.sh"                    # quickly access official documentation

# Networking
source "${DIR}/recipes/masscan/masscan.sh"

# Terminal and Shell
source "${DIR}/recipes/iterm2/iterm2.sh"
source "${DIR}/recipes/zsh/zsh.sh"
source "${DIR}/recipes/omzsh/omzsh.sh"
source "${DIR}/recipes/zsh-highlighting/zsh-highlighting.sh"
source "${DIR}/recipes/zsh-completions/zsh-completions.sh"

# Development Software/Tools
source "${DIR}/recipes/emacs/emacs.sh"
source "${DIR}/recipes/coda/coda.sh"
source "${DIR}/recipes/sublime-text/sublime-text.sh"
source "${DIR}/recipes/text-wrangler/text-wrangler.sh"
source "${DIR}/recipes/vim/vim.sh"
source "${DIR}/recipes/spf-13/spf-13.sh"
source "${DIR}/recipes/eclipse-java/eclipse-java.sh"

# Data Storage
source "${DIR}/recipes/redis/redis.sh"
source "${DIR}/recipes/elasticsearch/elasticsearch.sh"
source "${DIR}/recipes/mongodb/mongodb.sh"
source "${DIR}/recipes/mysql/mysql.sh"

# File System
source "${DIR}/recipes/dropbox/dropbox.sh"


# Virtualization
source "${DIR}/recipes/vagrant.sh"
source "${DIR}/recipes/virtualbox.sh"

# Go Programming
source "${DIR}/recipes/golang/golang.sh"

# Java Programming
source "${DIR}/recipes/java/java.sh"

# JavaScript Programming
source "${DIR}/recipes/node/node.sh"

# PHP Programming

# Python Programming
source "${DIR}/recipes/python3/python3.sh"
source "${DIR}/recipes/python-extra/python-extra.sh"

# Ruby Programming
source "${DIR}/recipes/ruby/ruby.sh"

# Front-End Tooling
source "${DIR}/recipes/sass/sass.sh"
source "${DIR}/recipes/jshint/jshint.sh"

# Debugging
source "${DIR}/recipes/ctail/ctail.sh"

# Cleanup any messes we left behind
# ---------------------------------------------------------------------
cleanup_install_files

exit $?
