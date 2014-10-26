# OS X Editors Setup

# Assumes:
# + Homebrew has been installed correctly.
# + Homebrew-cask has been tapped and installed correctly.

# Install Coda
###############################################################################
brew cask install coda

# Install Sublime Text 3
###############################################################################
brew cask install sublime-text
# Make 'subl' a command line shortcut for Sublime Text 2.
ln -s "/opt/homebrew-cask/Caskroom/sublime-text/3.0.6/Sublime Text 3.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Install Vim
###############################################################################
brew install vim

# Install Emacs
###############################################################################
brew install emacs
