#!/bin/bash
set -o nounset
# ==================================================================
# Internet Check
# Ping Google to check for internet connection. (Could be made more foolproof)
# @returns 0 (TRUE) 1 (FALSE)
# ==================================================================

inet_check(){
  yn_inet=0
  
  yn_inet=$(ping -q -W 1 -c 1 google.com >/dev/null 2>&1 && echo 0 || echo 1)

  if [ $yn_inet -eq 1 ]; then
    echo "$(tput setaf 165)Could not $(tput setaf 164)establish Internet $(tput setaf 163)connection.${RESET}"
    echo "$(tput setaf 165)C'mon yo?! $(tput setaf 164)Tha one thing $(tput setaf 163)you need to $(tput setaf 162)be a pimp and $(tput setaf 161)you ain't got it. $(tput setaf 160)Damn...${RESET}"
    exit 1
  fi
}



# Checking your own default gateway would be better. Work in progress...
# ping -q -W 1 -c 1 google.com >/dev/null 2>&1 && echo 0 || echo 1