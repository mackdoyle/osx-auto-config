# OS X Git Setup

# Assumes: 
# + Homebrew has been installed correctly.
# + Homebrew-cask has been tapped and installed correctly.


# Install latest Git release (1.8.3.2 as of May 15, 2013)
###############################################################################
# Apple default git (1.7.12.4) is out of date.
brew install git

# Configure git identity, aliases, and other settings.
git config --global user.name "Dalton Hubble"
git config --global user.email "dghubble@gmail.com"
git config --global alias.co checkout
git config --global alias.st completed
git config --global core.editor "subl -w"
git config --list

# Install the Github Application
brew cask install github




