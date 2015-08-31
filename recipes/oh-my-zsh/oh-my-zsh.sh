#!/bin/bash
# ==================================================================
# OS X Oh My Zsh Installation
# ==================================================================
recipe="oh-my-zsh"
installed_name="oh-my-zsh"
status=1
ZSH="${HOME}/.oh-my-zsh"
echo -e "Beginning ${BLUE}${recipe}${RESET}  installation"\\n

# Check for existing installations
# ------------------------------------------------------------------
check_git
recipe_check=$(command -v zsh)

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



