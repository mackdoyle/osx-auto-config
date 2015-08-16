# OS X Python Setup

# Assumes: 
# + GCC installed via XCode comamnd line tools (https://connect.apple.com)
# + Homebrew has been installed correctly.

# Note: The python installation that ships with OS X is not suitable for 
# development.

# Install latest Python 2.7.x release (2.7.5 as of May 15, 2013)
###############################################################################
# https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python
# Python releases: http://www.python.org/download/releases/ 
brew install python --framwework
# Includes pip (pip --version 1.3.1 installed in python2.7 site-packages)
# Includes distribute (pip freeze shows distribute==0.6.45)
# Use pip (no sudo) to install packages globally to /usr/local/lib/python2.7/site-packages 

# Virtualenv
# Install virtualenv (pip freeze shows virtualenv==1.9.1) for per-project
# package installations. Installs to /usr/local/lib/python2.7/site-packages
# Creates a copy of a specific version of Python (by default the version
# virtualenv was installed with, 2.7.x)
pip install virtualenv
# Usage
# virtualenv --distribute [--python=python3] venv 
# source venv/bin/activate
# deactivate

# Virtualenv-wrapper
# Install virtualenvwrapper (pip freeze shows virtualenvwrapper=4.0) for
# per-project package installations except that virtualenv directories
# are kept in (~/.virtualenvs) rather than in source code.
# Installs to /usr/local/lib/python2.7/site-packages
pip install virtualenvwrapper
echo -e "\n# Source virtualenvwrapper.sh script" >> ${HOME}/.bash_profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ${HOME}/.bash_profile
# mkvirtualenv --distribute [--python=python3] project-name (autoactivates it)
# workon project-name
# deactivate
# rmvirtualenv project-name
# lsvirtualenv, cdvirtualenv, cdsitepackages, lssitepackages
# Modify postactivate, postdeactivate in ~/.virtualenvs/project-name/bin to
# set environment variable or customize the environment.

# Install latest Python 3.x.x release (3.3.2 as of May 15, 2013)
###############################################################################
# https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python
# Python releases: http://www.python.org/download/releases/ 
brew install python3 --framework
# Python3 scripts directory /usr/local/share/python3 is empty. Not yet used.




