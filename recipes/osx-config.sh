# OS X Vagrant Setup

# Check for existing installations
###############################################################################
echo "Beginning Vagrant installation"
echo "Checking for existing installations..."
ynVBOX=$(type virtualbox)
ynVAGR=$(type vagrant)
installed=""

# Ensure Homebrew is installed before continuing
# ###############################################################################
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found.  Aborting in vagrant.sh"; exit 1; }


# Virtualbox
###############################################################################
if [[ "$ynVBOX" != "" ]]; then
  echo "Installing Virtualbox"
  brew cask install virtualbox
  installed="Virtualbox and $installed"
fi

# Vagrant
###############################################################################
if [[ "$ynVBOX" != "" ]]; then
  echo "Installing Vagrant"
  brew cask install vagrant
  installed="Virtualbox and $installed"
fi


# Display Installation results
# ###############################################################################
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $installed completed successfully.$(tput sgr 0)"
fi
#etc.