#!/bin/bash

# ======================================================================
# Cleanse File Names
# Make lower case and replce spaces with underscores
# ======================================================================

cleanse_fname(){
  local fname=$1
  fname=${fname,,} # lcase
  fname=${fname, ,_} # Underscore spaces

  echo "${fname}"
}
