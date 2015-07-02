#!/bin/bash
# ==================================================================
# OS X Xcode Command Line Tools
# Installing the Xcode command line tools on 10.7.x through 10.10.x
# ==================================================================

recipe`="Xcode Command Line Tools"
completed=0
echo "Beginning $recipe installation"

osx_vers=$(sw_vers -productVersion | awk -F "." '{print $2}')
cmd_line_tools_temp_file="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"

# Installing the latest Xcode command line tools on 10.9.x or 10.10.x
if [[ "$osx_vers" -eq 9 ]] || [[ "$osx_vers" -eq 10 ]]; then

	# Create the placeholder file which is checked by the softwareupdate tool 
	# before allowing the installation of the Xcode command line tools.
	touch "$cmd_line_tools_temp_file"
	
	# Find the last listed update in the Software Update feed with "Command Line Tools" in the name
	cmd_line_tools=$(softwareupdate -l | awk '/\*\ Command Line Tools/ { $1=$1;print }' | tail -1 | sed 's/^[[ \t]]*//;s/[[ \t]]*$//;s/*//' | cut -c 2-)
	
	#Install the command line tools
	
	softwareupdate -i "$cmd_line_tools" -v
	# Remove the temp file
	
	if [[ -f "$cmd_line_tools_temp_file" ]]; then
	  rm "$cmd_line_tools_temp_file"
	fi
	
	completed=$completed + 1
fi

# Installing the latest Xcode command line tools on 10.7.x and 10.8.x

# on 10.7/10.8, instead of using the software update feed, the command line tools are downloaded
# instead from public download URLs, which can be found in the dvtdownloadableindex:
# https://devimages.apple.com.edgekey.net/downloads/xcode/simulators/index-3905972D-B609-49CE-8D06-51ADC78E07BC.dvtdownloadableindex
if [[ "$osx_vers" -eq 7 ]] || [[ "$osx_vers" -eq 8 ]]; then

	if [[ "$osx_vers" -eq 7 ]]; then
	    DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
	fi
	
	if [[ "$osx_vers" -eq 8 ]]; then
	     DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_osx_mountain_lion_april_2014.dmg
	fi

		TOOLS=cltools.dmg
		curl "$DMGURL" -o "$TOOLS"
		TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
		hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT" -nobrowse
		installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
		hdiutil detach "$TMPMOUNT"
		rm -rf "$TMPMOUNT"
		rm "$TOOLS"
		completed=$completed + 1
fi


# Display Installation results
# -----------------------------------------------------------------------------------------------------------------------------------
if [[ "$completed" != 0 ]]; then
  echo "$(tput setaf 165)Installation of $recipe completed successfully.$(tput sgr 0)"
fi
#etc.

exit 0