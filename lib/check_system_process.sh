#!/bin/bash
# ==================================================================
# Check System Process
# Pass in the name of a system service and get 0 (is running) or 
# 1 (is not running).
#
# This script is useful for determining if a program is curently running
# ==================================================================

check_system_process() {
  local service="$1"
  local result=$(ps -a | sed -n /${service}/p)

  if [ "${RESULT:-null}" = null ]; then
      check_system_process_=1
  else
      check_system_process_=0
  fi
}