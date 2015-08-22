#!/usr/bin/env bash
set -o nounset   
set -o errexit # Note: add `|| true` to commands that you allow to fai
#set -o xtrace

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

# Check for existing installations
# ---------------------------------------------------------------------
echo "${DYELLOW}==> ${BLUE}Checking for core prerequisites...${RESET}"

# Check for Internet connection
inet_check

# Go ahead and run 'brew update' one time if it is already installed
 if test "$(which brew)"; then
   echo "Homebrew installed. Let's go ahead and run ${GREEN}brew update${RESET}'"
   brew update
 fi

# Ensure Homebrew and its depencies are installed before continuing
check_essential
echo -e "${GREEN}You have what's needed, let's carry on.${RESET}"\\n

# ---------------------------------------------------------------------
# Install Recipes
# ---------------------------------------------------------------------

for recipe in ${recipe_list[*]}; do
  source "$DIR/recipes/$recipe/$recipe.sh"
done

# ---------------------------------------------------------------------
# Cleanup any messes we left behind
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Cleaning up temporary files...${RESET}"
cleanup_install_files

# ---------------------------------------------------------------------
# Run Report
# ---------------------------------------------------------------------
source "${DIR}"/config/exit.cfg
echo -e "${GREEN}The following app where successfully installed...${RESET}"
echo -e "${ELEVATED}"


exit $?
