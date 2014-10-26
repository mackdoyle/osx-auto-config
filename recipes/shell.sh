# OS X Shell Environment Setup

# Check for existing installations
# ###############################################################################
echo "Beginning Vagrant installation"
echo "Checking for existing installations..."
installed="iTerm2"

# Ensure Homebrew is installed before continuing
# ###############################################################################
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found.  Aborting in vagrant.sh"; exit 1; }

# Install iTerm2
###############################################################################
brew cask install iterm2

# Environment Customizations
###############################################################################
echo -e "\n# Set the default text editor." >> ${HOME}/.bash_profile
echo "export EDITOR='subl -w'" >> ${HOME}/.bash_profile

# Bash Customizations
###############################################################################
brew install git bash-completion



# Display Installation results
# ###############################################################################
if [[ "$installed" != "" ]]; then
  echo "$(tput setaf 165)Installation of $installed completed successfully.$(tput sgr 0)"
fi
#etc.