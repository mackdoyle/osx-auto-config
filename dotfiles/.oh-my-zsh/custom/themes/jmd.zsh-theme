#!/bin/zsh
# set -o nounset
# -----------------------------------------------------------------------------
# FILE: jmd.zsh-theme
# DESCRIPTION: oh-my-zsh theme file, based on Prose, Remy and SMT.
# AUTHOR: Jason Doyle (jasonmackdoyle@gmail.com)
# VERSION: 0.5
#
# Allows for hooking a function to a command
# autoload -U add-zsh-hook
# then create your function and add it to a command like:
# add-zsh-hook -d [command_name] [function_name]
#
# SYMBOLS: ⇉ ⇆ ♺ ✚ ✓ ⎄ ⎇⤵ ⤹⌥ ⤼ ⥅ ︎⎇︎⌥ ⑁ ⑂ ⑃ ୮ ᚛᚜ ᚜᚛ ⭌ ≠ ◦ ⎆ ⨂ ⍐ ⍗ ⑆ ±
# -----------------------------------------------------------------------------

# Theme Constants
# ------------------------------------------------------------------
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="#:${FG[130]}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="${reset_color}"

DISABLE_UNTRACKED_FILES_DIRTY="${reset_color}"
ZSH_THEME_GIT_PROMPT_ADDED="${FG[112]} ✚${reset_color}"
ZSH_THEME_GIT_PROMPT_AHEAD=ANUM"${FG[130]} ⎇⤵${reset_color}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=ANUM"${FG[130]} ⎇⤵${reset_color}"
ZSH_THEME_GIT_PROMPT_BEHIND=BNUM"${FG[130]} ⤹⌥${reset_color}"
ZSH_THEME_GIT_PROMPT_CLEAN="${reset_color}${FG[118]} ●"
ZSH_THEME_GIT_PROMPT_DELETED="${FG[196]} ⨂${reset_color}"
ZSH_THEME_GIT_PROMPT_DIRTY="${reset_color}${FG[196]} ●"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="${FG[130]}BNUM${reset_color}"
ZSH_THEME_GIT_PROMPT_MERGING="⚡︎${reset_color}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[001]} ⎄${reset_color}"
ZSH_THEME_GIT_PROMPT_NOTSTAGED="${FG[172]} ⚠${reset_color}"
ZSH_THEME_GIT_PROMPT_PREFIX="${reset_color}on${FG[001]} "
#ZSH_THEME_GIT_PROMPT_CLEAN="${reset_color}[$(git_prompt_short_sha)]${FG[118]} ●"
#ZSH_THEME_GIT_PROMPT_DIRTY="${reset_color}[$(git_prompt_short_sha)]${FG[196]} ●"
ZSH_THEME_GIT_PROMPT_RENAMED="${FG[196]} ♺${reset_color}"
ZSH_THEME_GIT_PROMPT_STAGED="${FG[112]} ●${reset_color}"
ZSH_THEME_GIT_PROMPT_STASHED="${FG[112]} ⤤${reset_color}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset_color}"
ZSH_THEME_GIT_PROMPT_SYMBOL="${FG[027]}±"
ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[214]} ⇉${reset_color}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${reset_color}${FG[240]} ●"


# Functions to build prompt
# ------------------------------------------------------------------
# Context: user@hostname (who am I and where am I). Source: Remy Sharp
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.{%F{yellow}}.)$user%m"
  fi
}

# Get the name of the server currently logged into
box_name() {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Set the style of the prompt for the type of directory you are in
set_prefix() {
    git branch >/dev/null 2>/dev/null && echo "${FG[001]}±${reset_color} " && return
    echo "○${reset_color} "
}

# Prompt Path: Set the user name and current location
set_path(){
 echo "${FG[001]}%n${reset_color} on ${FG[001]}$(box_name)${reset_color} in"
}

PROMPT='$(set_path)${FG[130]} ${PWD/$HOME/~} ${FG[001]}$(git_prompt_info)
$(set_prefix)'

#='[$(git_prompt_short_sha)] ${return_status}$(git_time_since_commit)$(git_prompt_status)%{$reset_color%}'
