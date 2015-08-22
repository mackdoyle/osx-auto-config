#!/bin/bash
#set -x
#set -e
set -o nounset
# ==================================================================
# Don't hesitate. You know you want to elevate.
# This is the initializatin file for provisioning your Mac.
#
# For now, you can `source` the recipes that meet your tastes. Later
# versions will accept a list of apps to install and configure.
#
# Why do we have these recipes when we could simply stack a list of
# app names onto a `brew install` commmand? First, this program rolls 
# up the installation of apps with Bundler, cURL, Gem, Go, Hombrew, 
# Homebrew Cask, npm, pip and wget into a single package management
# tool. Sencond, This program is built to run on brand new systems, 
# systems that may have some but not all of these provisions or 
# systems that simply need things configured. In any case, you run
# `elevate -a` and your covered.
# ==================================================================

# Include Core Settings and Libs
# ---------------------------------------------------------------------
source config/init.cfg
source "${DIR}"/config/lib_loader.sh
source lib/parse_getopts.sh

# Begin a sudo session
persist_sudo

# Check for existing installations
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Checking for core prerequisites...${RESET}"

# Check for Internet connection
inet_check

# ---------------------------------------------------------------------
# OS X System Update
# Before we do anything, lets update the OS
# ---------------------------------------------------------------------
source "${DIR}/recipes/osx/osx_update.sh"


# ---------------------------------------------------------------------
# Preflight checks
# ---------------------------------------------------------------------
# Go ahead and run 'brew update' one time if it is already installed
# if test "$(which brew)"; then
  # echo "Homebrew installed. Let's go ahead and run ${GREEN}brew update${RESET}'"
  # brew update
# fi

# Ensure Homebrew and its depencies are installed before continuing
check_essential
echo "${GREEN}Success.${RESET}"

# ---------------------------------------------------------------------
# Install Recipes
# ---------------------------------------------------------------------
source "${DIR}/recipes/airmail/airmail.sh"
source "${DIR}/recipes/alfred/alfred.sh"
source "${DIR}/recipes/amethyst/amethyst.sh"
source "${DIR}/recipes/autojump/autojump.sh"
source "${DIR}/recipes/bower/bower.sh"
source "${DIR}/recipes/caffeine/caffeine.sh"
source "${DIR}/recipes/codekit/codekit.sh"
source "${DIR}/recipes/cliclick/cliclick.sh"
source "${DIR}/recipes/ctail/ctail.sh"
source "${DIR}/recipes/dash/dash.sh"
source "${DIR}/recipes/dropbox/dropbox.sh"
source "${DIR}/recipes/eclipse/eclipse.sh"
source "${DIR}/recipes/emacs/emacs.sh"
source "${DIR}/recipes/fonts/fonts.sh"
source "${DIR}/recipes/generator-jekyllized/generator-jekyllized.sh"
source "${DIR}/recipes/git/git.sh"
source "${DIR}/recipes/go/go.sh"
source "${DIR}/recipes/google-chrome/google-chrome.sh"
source "${DIR}/recipes/google-drive/google-drive.sh"
source "${DIR}/recipes/gradle/gradle.sh"
source "${DIR}/recipes/grunt-cli/grunt-cli.sh"
source "${DIR}/recipes/gulp/gulp.sh"
source "${DIR}/recipes/imagealpha/imagealpha.sh"
source "${DIR}/recipes/imageoptim/imageoptim.sh"
source "${DIR}/recipes/iterm2/iterm2.sh"
source "${DIR}/recipes/java/java.sh"
source "${DIR}/recipes/jdk 7 or 8.sh"
source "${DIR}/recipes/jekyll/jekyll.sh"
source "${DIR}/recipes/jetty/jetty.sh"
source "${DIR}/recipes/jq/jq.sh"
source "${DIR}/recipes/kubernetes-cli/kubernetes-cli.sh"
source "${DIR}/recipes/macdown/macdown.sh"
source "${DIR}/recipes/masscan/masscan.sh"
source "${DIR}/recipes/monotype-skyfonts/monotype-skyfonts.sh"
source "${DIR}/recipes/mysql/mysql.sh"
source "${DIR}/recipes/node-sass/node-sass.sh"
source "${DIR}/recipes/oh-my-zsh/oh-my-zsh.sh"
source "${DIR}/recipes/parker/parker.sh"
source "${DIR}/recipes/pygments/pygments.sh"
source "${DIR}/recipes/python3/python3.sh"
source "${DIR}/recipes/sketch-toolbox/sketch-toolbox.sh"
source "${DIR}/recipes/redis/redis.sh"
source "${DIR}/recipes/rbenv/rbenv.sh"
source "${DIR}/recipes/rbenv-bundler/rbenv-bundler.sh"
source "${DIR}/recipes/ruby-build/ruby-build.sh"
source "${DIR}/recipes/sass/sass.sh"
source "${DIR}/recipes/scala/scala.sh"
source "${DIR}/recipes/slack/slack.sh"
source "${DIR}/recipes/spectacle/spectacle.sh"
source "${DIR}/recipes/sublime-text/sublime-text.sh"
source "${DIR}/recipes/the-unarchiver/the-unarchiver.sh"
source "${DIR}/recipes/vagrant/vagrant.sh"
source "${DIR}/recipes/virtualbox/virtualbox.sh"
source "${DIR}/recipes/vim/vim.sh"
source "${DIR}/recipes/vim-spf-13/vim-spf-13.sh"
source "${DIR}/recipes/vlc/vlc.sh"
source "${DIR}/recipes/wget/wget.sh"
source "${DIR}/recipes/yoeman/yoeman.sh"
source "${DIR}/recipes/zsh/zsh.sh"

# ---------------------------------------------------------------------
# Set Custom OS X System Defaults
# ---------------------------------------------------------------------
source "${DIR}/recipes/osx/osx.sh"

# ---------------------------------------------------------------------
# Cleanup any messes we left behind
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Cleaning up temporary files...${RESET}"
cleanup_install_files

exit $?
