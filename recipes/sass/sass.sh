#!/bin/bash

recipe`="Sass"
PREREQ1=""
installed=""


# Check for existing installations
# ###############################################################################
echo "Beginning $recipe installation"
echo "Checking for prerequisites..."
ynSASS=$(type sass)
ynLINTER=$(type scss-lint)

# Ensure RubyGems is installed before continuing
# @NOTE: Ruby default on OS X. So this really needs to check that the proper version of Ruby for this recipe is installed
type gem >/dev/null 2>&1 || { echo >&2 "Aborting. RubyGems not found. Please remove the $recipe recipe and restart the installer."; bash $(DIR)/scripts/homebrew.sh; }


# Install Recipe
# ###############################################################################
if [[ "$ynSASS" != "" ]]; then
  echo "Installing $recipe"
 sudo gem install sass
 sudo gen install scss-lint
fi



# Display Installation results
# ###############################################################################
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $recipe status successfully.$(tput sgr 0)"
fi
#etc.