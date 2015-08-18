#!/bin/bash
# ==================================================================
# OS X Oh My Zsh Installation
# ==================================================================
recipe="zsh"
installed_name="zsh"
$ZSH="${HOME}/.oh-my-zsh"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_git

# Install Recipe
# ------------------------------------------------------------------
echo "${BLUE}==> Cloning Oh My Zsh...${RESET}"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
  echo "git not installed"
  exit
}



