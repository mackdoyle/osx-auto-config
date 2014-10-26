#!/bin/bash
# ==================================================================
# OS X Xcode Command Line Tools
# For a completly automated way to to this, see: http://macops.ca/installing-command-line-tools-automatically-on-mavericks/
# Also: git clone https://github.com/wdas/reposado.git
# ==================================================================

recipe`="Xcode Command Line Tools"
completed=0
echo "Beginning $recipe installation"

# Install Xcode 
# -----------------------------------------------------------------------------------------------------------------------------------
if test ! $(which xcode-select) then
  echo "Installing $recipe"
  xcode-select --install
  completed=$completed + 1 
fi

# Display Installation results
# -----------------------------------------------------------------------------------------------------------------------------------
if [[ "$completed" != 0 ]]; then
  echo "$(tput setaf 165)Installation of $recipe completed successfully.$(tput sgr 0)"
fi
#etc.

exit $?
