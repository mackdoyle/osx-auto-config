# OS X Essentials Setup

# Check for existing installations
###############################################################################
echo "Beginning Homebrew Cask installation"
echo "Checking for prerequisites..."

installed=""

# Ensure Homebrew is installed before continuing
# ###############################################################################
type brew >/dev/null 2>&1 || { echo >&2 "Homebrew not found. Attempting to install it for you"; bash $(DIR)/scripts/homebrew.sh; }


# Utilities
###############################################################################
brew install gnu-which

# Networking
###############################################################################
brew install wget
brew install curl
brew install libevent
brew install openssl


