# OS X Extras Setup

# Check for existing installations
###############################################################################
echo "Beginning Homebrew Cask installation"
echo "Checking for prerequisites..."

installed=""

# Ensure Homebrew is installed before continuing
# ###############################################################################
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }


# + Homebrew-cask has been tapped and installed correctly.

# Audio/Video
###############################################################################
brew cask install vlc
brew cask install google-hangouts


# Image Media
###############################################################################

# Menu Bar Utilities
###############################################################################
brew cask install caffeine         # prevent sleep          
brew cask install sip              # bad ass color selector


# Productivity
###############################################################################
brew cask install moom             # window manager
brew cask install alfred           # productivity, quick launch
brew cask install essentials       # Another good app launcher in case you you forget what to search for in Alphred



