#!/bin/bash

# Not sure why this is needed but adding check for Z-Shell as well - Jason Doyle
if (${SHELL} = "/bin/bash"); then
  source ~/.bash_profile
elif  (${SHELL} = "/bin/zsh"); then
  source ~/.zshrc
fi

function version_check() 
{
  app=$1
  actual_version=$2
  desired_version=$3
    echo "$actual_version >= $desired_version" | bc > /dev/null
  if [[ $? -ne 0 ]]; then
    echo "${YELLOW}[CHECK]${RESET}    ${app}: '$actual_version' should be at least '$desired_version'"
  else
    echo "${BLUE}[OK]${RESET}       ${app}: $actual_version"
  fi
}

echo
echo "Mismatches are not necessarilly bad."
echo "Check if your version is below the desired version at the major or minor point release level."
echo

#which gvm >/dev/null 2>&1 &&  || { echo >&2 "${RED}[WARN]${RESET} gvm is required but not found. Attempting to install it for you."; source "${DIR}"/recipes/gvm/gvm.sh; }
which brew >/dev/null 2>&1 && version_check "Homebrew" "$(brew --version | cut -c1-3)" "0.9" || { echo >&2 "${RED}[WARN]${RESET} Homebrew is required but not found."; }

which git >/dev/null 2>&1 && version_check "git" "$(git --version | cut -d' ' -f3 | cut -c1-3)" "2.1" || { echo >&2 "${RED}[WARN]${RESET} Git is required but not found."; }

which python >/dev/null 2>&1 && version_check "python" "$(python -V 2>&1 | cut -d' ' -f2 | cut -c1-3)" "2.7" || { echo >&2 "${RED}[WARN]${RESET} Python is required but not found."; }

which vagrant >/dev/null 2>&1 && version_check "Vagrant" "$(vagrant --version | cut -d' ' -f2 | cut -c1-3)" "1.6" || { echo >&2 "${RED}[WARN]${RESET} Vagrant is required but not found."; }

which VBoxManage >/dev/null 2>&1 && version_check "VirtualBox" "$(VBoxManage --version | cut -c1-3)" "4.3" || { echo >&2 "${RED}[WARN]${RESET} Virtualbox is required but not found."; }

which xcode-select >/dev/null 2>&1 && version_check "xcode dev tools" "$(xcode-select -version | cut -d' ' -f3 | cut -c1-4)" "2333" || { echo >&2 "${RED}[WARN]${RESET} Xcode is required but not found."; }

which java >/dev/null 2>&1 && version_check "Java" "$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -c1-3)" "1.7" || { echo >&2 "${RED}[WARN]${RESET} Java is required but not found."; }

which gvm >/dev/null 2>&1 && version_check "gvm" "$(gvm version | grep Groovy | cut -d ' ' -f4 | cut -c1-3)" "2.2" || { echo >&2 "${RED}[WARN]${RESET} gvm is required but not found."; }

which groovy >/dev/null 2>&1 && version_check "Groovy" "$(groovy -version | cut -d' ' -f3 | cut -c1-3)" "2.2" || { echo >&2 "${RED}[WARN]${RESET} Groovy is required but not found."; }

which gradle >/dev/null 2>&1 && version_check "Gradle" "$(gradle -version | grep Gradle | cut -d' ' -f2 | cut -c1-3)" "1.9" || { echo >&2 "${RED}[WARN]${RESET} Gradle is required but not found."; }

