#!/bin/bash
# ======================================================================
# Delimiter to Array
# Takes a list and a delimiter and converts it to a Bash array
#
# To understand how this works, see: 
# http://unix.stackexchange.com/questions/224548/bash-change-variable-contents-in-a-function-that-receives-the-variable-name-as
# ======================================================================

# delim_to_array() {Returns the list passed in but converted to an array}
# ----------------------------------------------------------------------
delim_to_array() {
        local IFS="${2:-$' :|'}"
        # printf "inside  IFS=<%s>\n" "$IFS"
        eval $1\=\(${!1}\);
}


