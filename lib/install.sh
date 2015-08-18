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
  test $2 && local installed_name=$2 || local installed_name=$1

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(type "${installed_name}")

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      gem install "${recipe}"
      rbenv rehash
      status=0
      show_results ${recipe} ${status}
    else
      show_results ${recipe} ${status}
    fi
  done
}

# Install Using Go
# ------------------------------------------------------------------
go_install_recipe() {
  status=1
  local recipes=$1
  test $2 && local installed_name=$2 || local installed_name=$1

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(type "${installed_name}")

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      go get "${recipe}"
      status=0
      show_results ${recipe} ${status}
    else
      show_results ${recipe} ${status}
    fi
  done
}

# Install Using Homebrew
# ------------------------------------------------------------------
brew_install_recipe() {
  status=1
  local recipes=$1
  test $2 && local installed_name=$2 || local installed_name=$1

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(type "${installed_name}")

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      brew install "${recipe}"
      status=0
      show_results ${recipe} ${status}
    else
      show_results ${recipe} ${status}
    fi
  done
}

# Install Using Homebrew Cask
# ------------------------------------------------------------------
brew_cask_install_recipe() {
  status=1
  local recipes=$1
  test $2 && local installed_name=$2 || local installed_name=$1

  local recipe_check="$(mdfind kMDItemContentTypeTree=com.apple.application-bundle -onlyin /Applications | grep ${recipe})"

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      brew cask install "${recipe}"
      status=0
      show_results ${recipe} ${status}
    else
      show_results ${recipe} ${status}
    fi
}

# Install Using Node Package Manager
# ------------------------------------------------------------------
npm_install_recipe() {
  status=1
  local recipes=$1
  test $2 && local installed_name=$2 || local installed_name=$1

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(type "${installed_name}")

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      npm install -g "${recipe}"
      status=0
      show_results ${recipe} ${status}
    else
      show_results ${recipe} ${status}
    fi
  done
}

# Download and install Using Curl
# ------------------------------------------------------------------
curl_download_recipe() {
  install_status=1
  local recipe=$1
  test $2 && local installed_name=$2 || local installed_name=$1
  
  local recipe_check=$(type "${recipe}")

  if test ! "${recipe_check}"; then
    echo "${BLUE}Installing ${recipe}${RESET}"
    curl -q "${recipe}" -0 "${DIR}/tmp"
    # NEED TO ADD METHOD OF AUTO INSTALLING AFTER DOWNLOAD
    install_status=0
  fi
}


