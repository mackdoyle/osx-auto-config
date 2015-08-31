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
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u

  echo "Beginning ${BLUE}$recipe${RESET} installation"
  
  for recipe in ${recipes[*]}
    do
    local recipe_check=$(command -v $installed_name)
  
    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      sudo gem install "${recipe}"
      status=0
      INSTALLED+=("${recipe}")
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done
}

# Install Using Go
# ------------------------------------------------------------------
go_install_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && local installed_name=$2 || local installed_name=$1
  set -u
  
  echo "Beginning ${BLUE}$recipe${RESET} installation"

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(command -v $installed_name)

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      go get "${recipe}"
      status=0
      INSTALLED+=("${recipe}")
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
  local recipes=$1
  set +u
  test "$2" && installed_name=$2 || installed_name=$1
  set -u
  
  echo "Beginning ${BLUE}$installed_name${RESET} installation"

  for recipe in ${recipes[*]}
    do
    # alternative: if test ! $(command -v ${recipe}); then
    if [[ -z "$(command -v $installed_name)" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      brew install "${recipe}" --quiet
      status=0
      INSTALLED+=("${recipe}")
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done

  unset status
  unset recipe_check
  unset installed_name
  unset recipes
  unset recipe
}

# Install Using Homebrew Cask
# ------------------------------------------------------------------
brew_cask_install_recipe() {
  local status=1
  local recipe_check=""
  local installed_name=""
  local recipes=($1)
  set +u
  test "$2" && installed_name="$2" || installed_name="$1"
  set -u

  echo "Beginning ${BLUE}$recipe${RESET} installation"

  for recipe in ${recipes[*]}
    do
    if [[ -z "$(mdfind kMDItemContentTypeTree=com.apple.application-bundle | grep $installed_name)" && -z "$(command -v $installed_name)" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      brew cask install "${recipe}" --quiet
      status=0
      INSTALLED+=("${recipe}")
      show_results "${recipe}" ${status}
    else
      show_results "${recipe}" ${status}
    fi
  done

  unset status
  unset recipe_check
  unset installed_name
  unset recipes
  unset recipe
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

  echo "Beginning ${BLUE}$recipe${RESET} installation"

  for recipe in ${recipes[*]}
    do
    local recipe_check=$(command -v ${installed_name})

    if [[ -z "${recipe_check}" ]]; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      npm install -g "${recipe}" --silent
      status=0
      INSTALLED+=("${recipe}")
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

  echo "Beginning ${BLUE}$installed_name${RESET} installation"

  for recipe in ${recipes[*]}
    do
    recipe_check=$(command -v "${recipe}")

    if test ! "${recipe_check}"; then
      echo "${BLUE}Installing ${recipe}${RESET}"
      curl -q "${recipe}" -0 "${DIR}/tmp"
      # NEED TO ADD METHOD OF AUTO INSTALLING AFTER DOWNLOAD
      status=0
      INSTALLED+=("${recipe}")
    fi
  done
}


