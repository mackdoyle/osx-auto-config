# OS X Ruby Setup

# Assumes: 
# + Curl has been brew installed.

# Ruby Version Manager (RVM) Latest (1.21.3 as of 2013/08/25)
# allows for multiple independed Ruby installations on the same machine.

# run the installer script, installs under $HOME/.rvm
curl -L https://get.rvm.io | bash -s stable
# note: adds source commands to ~/.bashrc or ~/.bash_profile or ~/.profile to
# ensure ~/.rvm is added to the path

# manually source RVM into current shell session (automatic in subsequent sessions)
source $HOME/.rvm/scripts/rvm

# allow rvm to install dependencies for Ruby during Ruby installs
rvm autolibs packages

echo "Installed rvm. Switch ruby versions with 'rvm use <version>'."


# install Ruby 1.9.3, Ruby 2.0.0
rvm install 1.9.3
rvm install 2.0.0
rvm use --default 2.0.0

echo "Installed ruby (1.9.3, 2.0.0) which each include irb, erb, \
    ri rdoc, testrb, rake, and gem."
echo "ruby 2.0.0 set as default"

# Result
# rvm -v  => 1.21.4(or never version)
# ruby -v =>  2.0.0
# Ruby comes with irb, rdoc, ri, and gems, which should
# Change the Ruby version used in a shell 

# Usage
# rvm install <ruby_version_number>
# rvm list will show the current Ruby versions installed.
# rvm use <ruby_version_number> sets current shell Ruby version
# rvm info will show the current shell's Ruby version and settings.
# rvm gemset list  shows the gemsets for the current Ruby
# rvm gemset create <name-gemset> creates a gemset in current Ruby.
# rvm gemset use <name-gemset> switch to using a particular gemset.
# rvm gemset name will show the name of the current gemset.
# rvm gemset empty <name-gemset> removes all gems from the gemset.
# rvm gemset delete <name-gemset> deletes the gemset itself.
# gem install <gem-name> to install a particular gem.
# gem list to list the installed gems
# bundle install to install gems from a Gemfile
# bundle show to show the gems.
# Gemsets are similar to Python virtualenvwrapper in that virtual
# environment collectons of packages are maintained at a central 
# location. 




