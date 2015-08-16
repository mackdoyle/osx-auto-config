# -----------------------------------------------------------------------------
#          FILE: jmd.zsh-theme
#   DESCRIPTION: oh-my-zsh theme file, based on Prose, Remy and SMT.
#        AUTHOR: Jason Doyle (jasonmackdoyle@gmail.com)
#       VERSION: 0.5
# -----------------------------------------------------------------------------

# REFERENCE: https://wiki.archlinux.org/index.php/zsh

# List colors available through OMZ: spectrum_ls
# SYMBOLS: ⇉ ⇆ ♺ ✚ ✓ ⎄ ⎇ ⤵ ⤹⌥ ⤼ ⥅ ︎⎇︎⌥ ⑁ ⑂ ⑃ ୮ ᚛᚜ ᚜᚛ ⭌ ≠ ◦ ⎆ ⨂ ⍐ ⍗ ⑆ ±

# zsh Prompt Reference
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}on%{$FG[001]%} "
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[112]%} ✓%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{[$FG[221]]%} ⚡%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$reset_color%} ○︎%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_STASHED="%{$FG[112]%} ⎆%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_NOTSTAGED="%{$FG[172]%} ⚠%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD=ANUM"%{$FG[130]%} ⎇⤵%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_BEHIND=BNUM"%{$FG[130]%} ⤹⌥%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$FG[130]%}BNUM%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[130]%}BNUM%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SYMBOL="%{$FG[027]%}±"
# ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[112]%} ✚%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[001]%} ⎄%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[196]%} ⨂%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[112]%} ●%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[196]%} ♺%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[214]%} ⇉%{$reset_color%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
# ZSH_THEME_GIT_PROMPT_SHA_BEFORE="#:%{$FG[130]%}"
# ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

# ------------------------------------------------------------------
# Allows for hooking a function to a command
# autoload -U add-zsh-hook
# then create your function and add it to a command like:
# add-zsh-hook -d [command_name] [function_name]
# ------------------------------------------------------------------

#Settings
# ------------------------------------------------------------------
autoload colors
colors


# Theme Constants
# ------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}on%{$FG[001]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}[$(git_prompt_short_sha)]%{$FG[118]%} ●"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}[$(git_prompt_short_sha)]%{$FG[196]%} ●"
ZSH_THEME_GIT_PROMPT_NOTSTAGED="%{$reset_color%}[$(git_prompt_short_sha)]%{$FG[142]%} ●"


# Functions to build prompt
# ------------------------------------------------------------------
# Context: user@hostname (who am I and where am I). Source: Remy Sharp
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user%m"
  fi
}

# Prompt Path: Set the user name and current location
prompt_path(){
 echo "%{$FG[001]%}%n%{$reset_color%} at %{$FG[001]%}$(box_name)%{$reset_color%} in"
}

# Git: branch/detached head, dirty status. Source: Remy Sharp
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    echo -n "${ref/refs\/heads\//⭠ }$dirty"
  fi
}

# Get the name of the server currently logged into
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Set the style of the prompt line
function set_prefix {
    git branch >/dev/null 2>/dev/null && echo "%{$FG[001]%}±%{$reset_color%} " && return
    echo "○%{$reset_color%} "
}


PROMPT='
$(prompt_path) %{$FG[130]%}${PWD/$HOME/~} %{$FG[001]%}$(git_prompt_info)
$(set_prefix)'

#RPROMPT='[$(git_prompt_short_sha)] ${return_status}$(git_time_since_commit)$(git_prompt_status)%{$reset_color%}'
