# OS X Go Setup

# Assumes: 
# + Homebrew has been installed correctly.
# + Homebrew-cask has been tapped and installed correctly.


# Install Go lang latest (1.1.1 as of May 13, 2013)
###############################################################################
brew install go

# Set up Go lang workspace
mkdir -p ${HOME}/go
mkdir -p ${HOME}/go/src
mkdir -p ${HOME}/go/pkg
mkdir -p ${HOME}/go/bin

# Set environment variable
# @TODO: Need to add conditional for multiple shells
echo -e "\n# Set GOPATH environment variable to the Go lang workspace." >> ${HOME}/.bash_profile
echo "export GOPATH=\$HOME/go" >> ${HOME}/.bash_profile
echo -e "\n# Add the Go Workspace's bin subdirectory to PATH." >> ${HOME}/.bash_profile
echo "PATH=\$PATH:\$GOPATH/bin" >> ${HOME}/.bash_profile
# Ensure GOPATH is set for the current shell session.
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
