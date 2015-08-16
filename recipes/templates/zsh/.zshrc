# ============================================================
# Main config file for Zsh"#020922"
#
# To include settings and keep this file clean, we could load
# them using: source ${HOME}/.zshrc.before
# ============================================================

# Force set ssh-agent value on load of terminal (not sure why this is all of the sudden needed)
# ------------------------------------------------------------
  eval "$(ssh-agent)"

# Path to your oh-my-zsh configuration.
# ------------------------------------------------------------
  ZSH=$HOME/.oh-my-zsh

# General
# ------------------------------------------------------------
  DISABLE_UPDATE_PROMPT=true
  COMPLETION_WAITING_DOTS=true
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8

# ------------------------------------------------------------
# Paths
# ------------------------------------------------------------

# -- Android --
  #export ANDROID_HOME="/usr/local/opt/android-sdk"
  #export PATH=~/projects/android-sdk-macosx/platform-tools:~/projects/android-sdk-macosx/tools:$PATH


# -- Homebrew --
  # Setting this will define it before /usr/bin so duplicate installs will take precedence over default core versions
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"

# -- Go Lang --
  export GOVERSION="$(brew list go | head -n 1 | cut -d '/' -f 6)"
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
  export PATH="$PATH:/usr/local/go/bin"
  export GOPATH="$HOME/go"
  export GOBIN="$GOPATH/bin"
  export PATH="$PATH:$GOPATH:$GOBIN"

# -- Java --
  export GLASSFISH_HOME=/usr/local/opt/glassfish/libexec
  export PATH=${PATH}:${GLASSFISH_HOME}/bin
  
# -- MySQL --
  #export PATH="$(brew --prefix mysql)/bin:$PATH"

# — Node.js —
  export PATH="$HOME/.node/bin:$PATH"
  #export NODE_PATH=="$HOME/.node/bin"/node_modules

# -- PHP --
  # System Default Location if unset: /usr/bin/php
  #export PATH="$(brew --prefix php54)/bin:$PATH"

# -- Ruby --
  # Load RVM profile
  #source ~/.profile
  #export PATH="$PATH:$HOME/.rvm/bin"

# -- Scripts --
  export PATH="$PATH:$HOME/Scripts/bin"


# ------------------------------------------------------------
# ZSH Specific Settings
# ------------------------------------------------------------

# Theme
# ------------------------------------------------------------
  export ZSH_THEME="jmd" #jmd, half-life, remy
  
# Extended completion features for zsh.
# ------------------------------------------------------------
  # If completions are failing, try rebuilding with: rm -f ~/.zcompdump; compinit
  fpath=(/usr/local/share/zsh-completions $fpath)

  # Enable command auto-correction.
  ENABLE_CORRECTION="true"

  # Display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"

# Plugins
# ------------------------------------------------------------
  plugins=(css-test command-coloring colorize color-ssh colored-man git git-extras gitignore jump brew-cask fabric extract )

# Extras
# ------------------------------------------------------------
  # Add this to git_prompt_status() in git.zsh
  # if $(echo "$INDEX" | grep -E '^\?\? ' &> /dev/null); then
  #    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  #  fi

# Finally, load interactive shell
# ------------------------------------------------------------
  source $ZSH/oh-my-zsh.sh


# -- Display terminal stats
#echo -e "\033[0;37m`uptime | sed 's/.*up ([^,]*), .*/1/'`"




