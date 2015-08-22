#!/bin/bash
#set -x
#set -e
# set -o posix # Make this conform to POSIX
set -o nounset
# ==================================================================
# We have lift off!
# This is the master file that first installs any needed dependencies and begins to install and configure 
# @TODO: Look into Bash Plugin Arch: https://code.google.com/p/b-p-a/
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
echo "${DYELLOW}==> ${BLUE}Checking for core prerequisites...${RESET}"

# Check for Internet connection
#inet_check

# Go ahead and run 'brew update' one time if it is already installed
# if test "$(which brew)"; then
  # echo "Homebrew installed. Let's go ahead and run ${GREEN}brew update${RESET}'"
  # brew update
# fi

# Ensure Homebrew and its depencies are installed before continuing
check_essential
echo -e "${GREEN}You have what's needed, let's carry on.${RESET}"\\n

# ---------------------------------------------------------------------
# Install Recipes
# Source commands for recipes should be availble as 
# $sourced_recipes[@] as set in parse_getopts.sh
# ---------------------------------------------------------------------

for recipe in ${sourced_recipes[*]}; do
  source "$DIR/recipes/$recipe/$recipe.sh"
  #echo "LOOPED:::::::::::::::::::::::::::::"
done
exit 1
# ---------------------------------------------------------------------
# Cleanup any messes we left behind
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Cleaning up temporary files...${RESET}"
cleanup_install_files

exit $?
