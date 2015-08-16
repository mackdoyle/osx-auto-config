#!/bin/bash
#set -x
# ==================================================================
# We have lift off!
# This is the master file that first installs any needed dependencies and begins to install and configure 
# @TODO: Look into Bash Plugin Arch: https://code.google.com/p/b-p-a/
# ==================================================================

# Include Core Settings
# ---------------------------------------------------------------------
source init.cfg
echo "Welcome to the OS X provisioning tool. Get ready to feel like a ${DYELLOW}p${LYELLOW}im${DYELLOW}p${RESET}!"

# Include Core library files
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Loading core library files...${RESET}"
source "${DIR}"/lib/lib_loader.sh
echo "${GREEN}Success.${RESET}"

# Check for existing installations
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Checking for core prerequisites...${RESET}"

# Check for Internet connection
inet_check

# Go ahead and run 'brew update' one time if it is already installed
# if test "$(which brew)"; then
  # echo "Homebrew installed. Let's go ahead and run ${GREEN}brew update${RESET}'"
  # brew update
# fi

# Ensure Homebrew and its depencies are installed before continuing
check_essential
echo "${GREEN}Success.${RESET}"


# Install Recipes
# ---------------------------------------------------------------------
#bash "${DIR}"/recipes/coda.sh
#source "${DIR}"/recipes/sublime-text/sublime-text.sh
source "${DIR}/recipes/redis/redis.sh"

# Databases
#source "${DIR}/recipes/redis/redis.sh"

# Cleanup any messes we left behind
# ---------------------------------------------------------------------
echo "${BLUE}==> ${RESET}${DYELLOW}Cleaning up temporary files...${RESET}"
cleanup_install_files

exit $?
