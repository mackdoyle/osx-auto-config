#!/bin/bash
# ==================================================================
# Persist Sudo
# Asks for credentials and persists sudo for the rest of the session
# ==================================================================

get_user_info() {
  # Check for user and prompt for password if needed
  echo -e \\n"${YELLOW}Please enter an administrative password to get started.${RESET}"

  sudo -v

  while true; 
  do 
    sudo -n true; 
    sleep 60; kill -0 "$$" || exit; 
  done 2>/dev/null &

  # Get name and email for use later, like when configuring Git global config.
  echo -e \\n"${YELLOW}Please provide some info we can use in configuration files.${RESET}"
  
  echo -ne "Enter your full name and hit [ENTER] "\\n
  read user_name
  
  echo -ne "Enter an email address and hit [ENTER] "\\n
  read user_email
}