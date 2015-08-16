# =======================================================================
#          FILE: jmd.zsh-theme
#   DESCRIPTION: Defines custom aliases for Linux distros
#        AUTHOR: Jason Doyle (jasonmackdoyle@gmail.com)
#       VERSION: 3.1
# =======================================================================


  # Workflow Shortcuts
  # -----------------------------------
  #alias sassync="git checkout sites/all/themes/wheretraveler2_desktop_new_mobile/css/global.css sites/all/themes/wheretraveler2_desktop_new_mobile/css/global-blessed1.css sites/all/themes/wheretraveler2_desktop_new_mobile/css/contest.css"
  #alias rsyncwt="drush rsync @wt.live:%files @wt.local:%files"

  # Add todo item to desktop
  todo() { touch ~/Desktop/$1 }
  
  # Load man page in Safari using Bwana
  sman() {
    open -a Safari man://$@
  }

  # Recall installed CSV Utilities
  alias csvhelp='csvfix help, csvkit, csvdedupe, csvlink, dedupe_sources.py, split.py'

  # iTerm2
  # -----------------------------------
  # Open new iTerm tab and pass command to it. Ex: tab && vim ~/.bashrc
  tab() {
    osascript -e 'tell application "iTerm" to activate' -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down'
  }



# =======================================================================
# SERVER ALIASES
# =======================================================================

  # Virtualbox
  # -----------------------------------
  #alias minimalup="vboxmanage startvm minimal --type headless & "
  #alias minimalup="vboxmanage startvm minimal --type headless && mount -t smbfs //jdoyle@192.168.56.101/www share "
  alias minimalup='vboxmanage startvm minimal --type headless && echo "Mounting Samba share..." & osascript -e "try" -e "mount volume \"smb://jdoyle@192.168.56.101/www\"" -e "end try"'
  alias minimaltools='Apache, Elasticsearch, Kibana, Logstash, mySQL, multitail, nGinX, PHP, Zabbix'

# =======================================================================
# DATABASE ALIASES
# =======================================================================

	# Elasticsearch
	# -----------------------------------
	alias esstart="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
	
  # MongoDB
  # -----------------------------------
  # MongoDB Start
  mongodb() {
    mongod --config /usr/local/etc/mongod.conf
  }



# =======================================================================
# NETWORK ALIASES
# =======================================================================

# View HTTP traffic
# -----------------------------------
  alias httpsniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
  alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Flush DNS
# -----------------------------------
  alias flushdns="dscacheutil -flushcache"


# =======================================================================
# STSTEM ALIASES
# =======================================================================

# Open the System Caches Directory
# -----------------------------------
 alias caches "open $TMPDIR../C/"

# Make executable
# -----------------------------------
 chx(){ sudo chmod +x $@ }
 

# Pretty PS
# -----------------------------------
  # Format the output of the ps command. For example compare:
  # $ps axu | grep mysql | prettyps TO $ps axu | grep mysql
  # This cleans up all multi-column results, not just ps.
  alias prettyps="~/scripts/prettyps.sh"


# Files and Directories
# -----------------------------------
  alias l="ls -la"              # Show files in one column.
  alias ll="ls -lh"             # Show human readable.
  alias lh="ls -a | grep '^\.'" # show only hidden files
  sd() { cd $@ && ls -la; }     # Auto ls when changing to directories

  # Make directory and change into it
  cdm() { mkdir -p $@; cd $@; }
  
  # cd into whatever is the forefront Finder window.
  cdf() {  # short for cdfinder
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
  }



# =======================================================================
# PROGRAM ALIASES
# =======================================================================


# CSS Dig
# -----------------------------------
  # Pass in URL path to file with <link> to CSS
  cssdig(){
    python  /usr/local/Library/cssdig/cssdig.py $1
  }

# Git
# -----------------------------------
  alias gadd="git add -A :/"
  alias gpom="git pull origin master"
  alias gpush="git push"
  alias gstat="git status"
  alias gundo="git push -f origin HEAD^:master"  # Undo a `git push`

  # Perform a `git add` `git commit` and `git push`. Ex. gacom 'Fixing broken callback'
  gacom() {
    git add -A :/ && git commit -m $1 && git push
  }
  
  # Perform a diff on the 2 files passed in the arguments
  gdiff () {
    git difftool -d -t bbdiff $@
  }

# Open in...
# -----------------------------------
  alias dashbash="open dash://bash:{query}"

   # Open a file in BBEdit #
  bbe() { open $1 -a "BBEdit" }
  
  # Open a file in Chrome #
  chrome() { open $1 -a "Google Chrome" }

  # Open a file in Macdown #
  macdown() { open $1 -a "MacDown" }
  
  # Open a file in Sublime #
  sub() { open $1 -a "Sublime Text" }
  #subl() { open $1 -a "Sublime Text" }


  
  
# Hovercraft
# -----------------------------------
  # hover build - build the rst file, opens it in a browser and sets browser to fullscreen mode.
  # hover start - opens the presentation in fullscreen.
  # hover - shortcut for hovercraft command.
  hover() {
    if [[ "$1" == "build" ]]; then
      hovercraft index.rst ./ || exit 1;
      open "/Applications/Google Chrome.app" --args --start-fullscreen "$PWD/index.html";
    elif [[ "$1" == "start" ]]; then
      open "/Applications/Google Chrome.app" --args --start-fullscreen "$PWD/index.html";
    else
      hovercraft $@;
    fi
  }
    

# Jump
# Jump to marked directory and list contents
# -----------------------------------
  jmp() {
    jump $@ && ls -la;
  }


# Safari
# -----------------------------------
  safari() {
    open -a Safari $@
  }


# Vagrant
# -----------------------------------
  v() {
    vagrant $@
  }

  
# iPhone Simulator
# -----------------------------------
  isim() {
    open "/Applications/iOS Simulator.app";
  }
  
# Zsh
# -----------------------------------
  alias aliases="bbe ~/.oh-my-zsh/custom/my_aliases.zsh"



# =======================================================================
# MISC
# =======================================================================

# Video to Animated Gif
# -----------------------------------
  # Animated gifs from any video
  # From alex sexton   gist.github.com/SlexAxton/4989674
  gifify() {
    if [[ -n "$1" ]]; then
      if [[ $2 == '--good' ]]; then
        ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
        time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
        rm out-static*.png
      else
        ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
      fi
    else
      echo "proper usage: gifify <input_movie.mov>. You DO need to include extension. "
    fi
  }
  
  alias hist="cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -12"
  


# Cheatsheets
# -----------------------------------
  cheat() {
    if [[ "$1" == "bash" ]]; then
      open -a /Applications/Google\ Chrome.app "http://overapi.com/linux/"
    elif [[ "$1" == "esearch" ]]; then
      open -a /Applications/Google\ Chrome.app "http://elasticsearch-cheatsheet.jolicode.com/"
    elif [[ "$1" == "express" ]]; then
      open -a /Applications/Google\ Chrome.app "http://overapi.com/express/"
    elif [[ "$1" == "jquery" ]]; then
      open -a /Applications/Google\ Chrome.app "http://overapi.com/jquery/"
    elif [[ "$1" == "node" ]]; then
      open -a /Applications/Google\ Chrome.app "http://overapi.com/nodejs/"
      open -a /Applications/Google\ Chrome.app "https://gentlenode.com/journal/node-2-complete-cheatsheet/23"
    else
      echo "No cheat sheet found for $1"    
    fi
  }
  