#!/bin/bash
# ==================================================================
# OS X Oh My Zsh Installation
# ==================================================================
recipe="zsh"
installed_name="zsh"
status=1
$ZSH="${HOME}/.oh-my-zsh"
echo "Beginning $recipe installation"

# Check for existing installations
# ------------------------------------------------------------------
check_git
recipe_check=$(which $installed_name)

# Install Recipe
# ------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
  echo "${BLUE}==> Cloning Oh My Zsh...${RESET}"
  hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH || {
    echo "git not installed"
    exit
  }
  status=0
else
  show_results "${recipe}" ${status}
fi



