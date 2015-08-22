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
    echo -e "${GREEN}Installation of ${recipe} completed successfully.${RESET}"\\n
  else
    echo -e "${YELLOW}Skipping ${recipe} as it appears to already be installed.${RESET}"\\n
  fi
}

show_config_results() {
  local recipe=$1
  local status=$2

  if [[ "${status}" = 0 ]]; then
    echo -e "${GREEN}Configuration of ${recipe} completed successfully.${RESET}"\\n
  else
    echo -e "${RED}There was a problem configuring ${recipe}. You will need to manually configure it later.${RESET}"\\n
  fi
}

