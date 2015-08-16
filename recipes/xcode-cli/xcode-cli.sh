#!/bin/bash
# ==================================================================
# OS X Xcode Command Line Tools Installation
# Installing the Xcode command line tools on 10.7.x through 10.10.x
# ==================================================================
recipe="xcode-select"
installed_name="xcode-select"
[[ -z "${DIR}" ]] && DIR=$1
status=1
echo "Beginning ${recipe} installation"
recipe_check="$(type ${recipe})"

# Install Recipe
# ------------------------------------------------------------------
if [[ -z "${recipe_check}" ]]; then
	osx_vers=$(sw_vers -productVersion | awk -F "." '{print $2}')
	cmd_line_tools_temp_file="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"

	# For OS X 10.9.x and 10.10.x
	# On these versions the Command Line Tools package is available via the Software Update Feed.
	if [[ "$osx_vers" -eq 9 ]] || [[ "$osx_vers" -eq 10 ]]; then

		# Create a temp location
		touch "$cmd_line_tools_temp_file"
		
		# Find the last listed update in the Software Update feed with "Command Line Tools" in the name
		cmd_line_tools=$(softwareupdate -l | awk '/\*\ Command Line Tools/ { $1=$1;print }' | tail -1 | sed 's/^[[ \t]]*//;s/[[ \t]]*$//;s/*//' | cut -c 2-)
		
		#Install the Command Line Tools
		softwareupdate -i "$cmd_line_tools" -v

		# Remove the temp file
		if [[ -f "$cmd_line_tools_temp_file" ]]; then
		  rm "$cmd_line_tools_temp_file"
		fi

		status=$status + 1
	fi

	# For OS X 10.7.x and 10.8.x
	# On these versions the Command Line Tools package is available as a downloadable .dmg.
	if [[ "$osx_vers" -eq 7 ]] || [[ "$osx_vers" -eq 8 ]]; then

		if [[ "$osx_vers" -eq 7 ]]; then
		    dmg_path=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
		fi
		
		if [[ "$osx_vers" -eq 8 ]]; then
		     dmg_path=http://devimages.apple.com/downloads/xcode/command_line_tools_for_osx_mountain_lion_april_2014.dmg
		fi

			TOOLS=cltools.dmg
			curl "$dmg_path" -o "$TOOLS"
			TMPMOUNT=$(/usr/bin/mktemp -d /tmp/clitools.XXXX)
			hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT" -nobrowse
			installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
			hdiutil detach "$TMPMOUNT"
			rm -rf "$TMPMOUNT"
			rm "$TOOLS"
			status=$status + 1
	fi

fi 

# Display Installation results
# ---------------------------------------------------------------------
# @params $recipe $status
show_results ${recipe} 0
