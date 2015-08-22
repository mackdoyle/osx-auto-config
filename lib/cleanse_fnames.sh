#!/bin/bash

# ======================================================================
# Data normalization helpers
# ======================================================================

# Make lower case and replce spaces with underscores
# ---------------------------------------------------------------------
function cleanse_string() {
  local cleanse_string_=$1
  cleanse_string_=${cleanse_string_,,} # lcase
  cleanse_string_=${cleanse_string_, ,_} # Underscore spaces
}

# Remove spaces
# ---------------------------------------------------------------------
function remove_spaces() {
  local remove_spaces_=$1
  remove_spaces_=${remove_spaces_// /}
}
