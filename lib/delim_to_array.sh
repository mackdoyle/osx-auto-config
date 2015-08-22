#!/bin/bash
# ======================================================================
# Delimiter to Array
# Takes a list and a delimiter and converts it to a Bash array
#
# This script works by redefining the built-in IFS variable to the delimiter 
# character and assign the values to a new variable using the 
# array=($<string_var>), and then reseting IFS back to its original state.. 
# ======================================================================

# delim_to_array() {}
# ----------------------------------------------------------------------

delim_to_array() {
  local list=$1
  local delim=$2
  local oifs=$IFS;
  
  IFS="$delim ";
  delim_to_array_=($list);
  IFS=$oifs;

  #echo "${delim_to_array_[*]}"
}


