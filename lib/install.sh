#!/bin/bash
# ==================================================================
# Install Recipe
# Provides several functions for installing apps and services using
# various package managers and http clients.
# ==================================================================

# Ensure global requirements for these functions are met
# ------------------------------------------------------------------
[ -n "${DIR}" ] || echo "$(tput setaf 120)ERROR: Required global 'DIR' no set. Exiting$(tput sgr 0)";

# Install Using Ruby Gem
# ------------------------------------------------------------------
gem_install_recipe() {
  status=1
  local recipes=$1
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(which $installed_name)

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      #sudo gem install "${recipe}"
      status=0
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done
}

# Install Using Go
# ------------------------------------------------------------------
go_install_recipe() {
  status=1
  local recipes=$1
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u
  
  for recipe in ${recipes[*]}
    do
    local recipe_check=$(which $installed_name)

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      go get "${recipe}"
      status=0
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done
}

# Install Using Homebrew
# ------------------------------------------------------------------
brew_install_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && installed_name=$2 || installed_name=$1
  set -u
  
  for recipe in ${recipes[*]}
    do
    local recipe_check=$(which $installed_name)

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      #brew install "${recipe}"
      status=0
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done
}

# Install Using Homebrew Cask
# ------------------------------------------------------------------
brew_cask_install_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=$1
  set +u
  test "$2" && installed_name="$2" || installed_name="$1"
  set -u

  recipe_check=$(mdfind kMDItemContentTypeTree=com.apple.application-bundle | grep "$installed_name")
 
    if [[ -z "${recipe_check}" ]]; then
      #brew cask install "${recipe}"
      status=0
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
}

# Install Using Node Package Manager
# ------------------------------------------------------------------
npm_install_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u

  for recipe in ${recipes[*]}
    do
    recipe_check=$(which ${installed_name})

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      npm install -g "${recipe}"
      status=0
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done
}

# Download and install Using Curl
# ------------------------------------------------------------------
curl_download_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u

  local recipe_check=$(type "${recipe}")

  if test ! "${recipe_check}"; then
    echo "${BLUE}Installing ${recipe}${RESET}"
    curl -q "${recipe}" -0 "${DIR}/tmp"
    # NEED TO ADD METHOD OF AUTO INSTALLING AFTER DOWNLOAD
    status=0
  fi
}


