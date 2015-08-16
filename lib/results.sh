#!/bin/bash
# ==================================================================
# Display Installation results
#
# EX: show_results recipe 1
# @recipe name_of_recipe
# @status 0 (TRUE) or 1 (FALSE)
# ==================================================================

show_results() {
  local recipe=$1
  local status=$2

  if [[ "${status}" = 0 ]]; then
    echo "${GREEN}Installation of ${recipe} completed successfully.${RESET}"
  else
    echo "${BLUE}${recipe} appears to already be installed.${RESET}"
  fi
  #etc.
}

declare -i current_level=1
level_up() {

  case $current_level in
    1)
      echo "LEVEL UP! Pixel Pusher"
      ;;
    2)
      echo "LEVEL UP! Maker"
      ;;
    3)
      echo "LEVEL UP! Codesmith"
      ;;
    4)
      echo "LEVEL UP! Journeyman"
      ;;
    5)
      echo "LEVEL UP! Power user"
      ;;
    6)
      echo "LEVEL UP! DAMN...."
      ;;
  esac

  current_level=$((current_level-1))
}