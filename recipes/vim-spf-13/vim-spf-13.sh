#!/bin/bash
# =====================================================================
# SPF-13 flavor of Vim for OS X Installation
# =====================================================================
recipe="SPF-13"
status=1

# Install SPF-13
# ---------------------------------------------------------------------
echo "Beginning ${BLUE}$installed_name${RESET} installation"

spf_check="$(ls ${HOME}/.spf13*)"
if [ -z "${spf_check}" ]; then
  echo "${BLUE}Installing ${recipe}${RESET}"
  curl http://j.mp/spf13-vim3 -L -o - | sh
  status=0
  INSTALLED+=("${recipe}")
  show_results "${recipe}" ${status}
else
  show_results "${recipe}" ${status}
    
fi



