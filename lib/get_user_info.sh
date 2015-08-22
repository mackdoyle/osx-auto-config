#!/bin/bash
# ==================================================================
# Persist Sudo
# Asks for credentials and persists sudo for the rest of the session
# ==================================================================

get_user_info() {
  curr_user="$(whoami)"

  if ( "${curr_user}" != "root" ); then 
    echo ""
    echo "${YELLOW}Please enter an administrative password to get started.${RESET}"
  else
    echo "I am: $(whoami)"
  fi

  sudo -v
  while true; do sudo -n true; sleep 240; kill -0 "$$" || exit; done 2>/dev/null &
exit 1
}