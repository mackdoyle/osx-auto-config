#!/bin/bash
source ~/.bash_profile

function version_check() 
{
	app=$1
	actual_version=$2
	desired_version=$3
    echo "$actual_version >= $desired_version" | bc > /dev/null
	if [[ $? -ne 0 ]]; then
		echo "CHECK    ${app}: '$actual_version' should be at least '$desired_version'"
	else
		echo "OK       ${app}: $actual_version"
	fi
}

echo
echo "Mismatches are not necessarilly bad."
echo "Check if your version is below the desired version at the major or minor point release level."
echo

version_check "Homebrew" "$(brew --version | cut -c1-3)" "0.9"

version_check "git" "$(git --version | cut -d' ' -f3 | cut -c1-3)" "2.1"

version_check "python" "$(python -V 2>&1 | cut -d' ' -f2 | cut -c1-3)" "2.7"

version_check "Vagrant" "$(vagrant --version | cut -d' ' -f2 | cut -c1-3)" "1.6"

version_check "VirtualBox" "$(VBoxManage --version | cut -c1-3)" "4.3"

version_check "IntelliJ" "$(cat '/Applications/IntelliJ IDEA 13 CE.app/build.txt' | cut -c 4-)" "135.1230"

version_check "xcode dev tools" "$(xcode-select -version | cut -d' ' -f3 | cut -c1-4)" "2333"

version_check "Java" "$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -c1-3)" "1.7"

version_check "gvm" "$(gvm version | grep Groovy | cut -d ' ' -f4 | cut -c1-3)" "2.2"

version_check "Groovy" "$(groovy -version | cut -d' ' -f3 | cut -c1-3)" "2.2"

version_check "Gradle" "$(gradle -version | grep Gradle | cut -d' ' -f2 | cut -c1-3)" "1.9"