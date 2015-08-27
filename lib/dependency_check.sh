#!/bin/bash
set -o nounset
# ==================================================================
# Dependency Check
# Check for existing installations of required dependencies and 
# install them if not already.
# ==================================================================

# Check for Curl
# ----------------------------------------------------------------------
check_curl() {
  check_homebrew
  type curl >/dev/null 2>&1 || { echo >&2 "${YELLOW}Curl not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/curl/curl.sh; } 
}

# Check for Easy Install
# ----------------------------------------------------------------------
check_easy_install() {
  check_homebrew
  type easy_install >/dev/null 2>&1 || { echo >&2 "${YELLOW}Easy Install not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/python/python.sh; }
}

# Check for Gem (Ruby)
# ----------------------------------------------------------------------
check_gem() {
  type gem >/dev/null 2>&1 || { echo >&2 "${YELLOW}Ruby gem not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/gem/gem.sh; }
}

# Check for Git
# ----------------------------------------------------------------------
check_git() {
  type git >/dev/null 2>&1 || { echo >&2 "${YELLOW}Git not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/git/git.sh; }
}

# Check for Homebrew
# ----------------------------------------------------------------------
check_homebrew() {
  check_xcode
  type brew >/dev/null 2>&1 || { echo >&2 "${YELLOW}Homebrew not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/homebrew/homebrew.sh; }
}

# Check for Homebrew Cask
# ----------------------------------------------------------------------
check_homebrew_cask() {
  check_homebrew
  type brew-cask >/dev/null 2>&1 || { echo >&2 "${YELLOW}Homebrew Cask not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/homebrew_cask/homebrew_cask.sh; }
}

# Check for NPM (Node.js)
# ----------------------------------------------------------------------
check_npm() {
  type npm >/dev/null 2>&1 || { echo >&2 "${YELLOW}Node Packer Manager not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/node/npm.sh; }
}

# Check for Virtualbox
# ----------------------------------------------------------------------
check_virtualbox() {
  check_homebrew_cask
  type virtualbox >/dev/null 2>&1 || { echo >&2 "${YELLOW}Virtulbox not found. Attempting to install it for you${RESET}"; source "${DIR}"/recipes/virtualbox/virtualbox.sh; }
}

# Check for XCode CLI
# ----------------------------------------------------------------------
check_xcode() {
  type xcode-select >/dev/null 2>&1 || { echo >&2 "${YELLOW}XCode not found. Attempting to install it for you${RESET}"; source "${DIR}"/sys/xcode-cli/xcode-cli.sh; }
}

# Check for essential prereqs with one call
# ----------------------------------------------------------------------
check_essential() {
  #check_xcode yn_message=1
  #check_homebrew yn_message=1
  check_homebrew_cask yn_message=1
  check_curl yn_message=0

  # @TODO: Add check for Ruby
}


