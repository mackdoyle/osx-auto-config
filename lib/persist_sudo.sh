#!/bin/bash
# ==================================================================
# Persist Sudo
# Asks for credentials and persists sudo for the rest of the session
# ==================================================================

persist_sudo() {
  echo ""
  echo "${YELLOW}Please enter an administrative password to get started.${RESET}"
  
  sudo -v
  while true; do sudo -n true; sleep 240; kill -0 "$$" || exit; done 2>/dev/null &
}