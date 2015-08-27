#!/bin/bash
# ==================================================================
# Node.js Installation
# This recipe will check if npm was installed with node.js and remove it
# if so. It will then insrall node.js and npm separately so npm
# installations are not dependant on sudo.
# ==================================================================
recipe="node"
status=1

# Check for existing installations
# ------------------------------------------------------------------
check_homebrew

# Let's check if npm is installed and if so, where its installs modules
npm_loc=$( cd "$( dirname "$(npm config get prefix)" )" && pwd )
if ( "${npm_loc}" == "${HOME}" ) then
  echo "Skipping $recipe installation"
  status=0
else
  

  status=1
fi

# Install Recipe
# ------------------------------------------------------------------
if [[ ${status} -eq 1 ]]; then
  # Lets install node and npm separately
  mkdir ${HOME}/.npmrc
if [ $? -ne 0 ]; then
  echo "failed to mkdir ${HOME}/.npmrc. Try executing: sudo chmod -R 755 ${HOME}/.npmrc" >&2
  exit 1
fi

  brew install node --without-npm
  echo prefix=~/.node >> ~/.npmrc
  curl -L https://www.npmjs.org/install.sh | sh

  # Add path to bash and zsh
  echo -e "\n# Nodejs Paths" >> ".bash_profile"
  echo -e "\nPATH=${HOME}/.node/bin:$PATH" >> ".bash_profile"
  echo -e "\n# Nodejs Paths" >> ".zshrc"
  echo -e "\nPATH=${HOME}/.node/bin:$PATH" >> ".zshrc"
fi



