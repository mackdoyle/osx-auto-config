#!/bin/bash
# ==================================================================
# OS X Operating System Update
# ==================================================================
recipe="osx_update"
echo "Checking for available system updates. If you are asked to restart"

# Check for existing installations
# ------------------------------------------------------------------
# sudo softwareupdate -irv # Install only the recommended updates.

# Or you can just install specific software updates by specifying the shorthand package name from the previous list, like so:
# sudo softwareupdate -i iPhoneConfigurationUtility-3.2

#If there are any updates you want to ignore, you can do so with the –ignore flag, for example:
# sudo softwareupdate --ignore iWeb3.0.2-3.0.2

#If you want to see all the available command line shortcuts for Software Update, just type:
# softwareupdate -h


# Install Recipe
# ------------------------------------------------------------------

# Get latest version used by Nike
# Search for the "org.eclipse.jetty.version" property key.
curl="http://stash.nikedev.com/projects/EDF/repos/tesla/browse/tesla-src/pom.xml"

# Use the cURL setting to put the result into a variable rather than printing it    
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); 

# Store the result rather than print (as we set CURLOPT_RETURNTRANSFER)
$result = curl_exec($curl);
if ( $result === false ){
    #something went wrong, handle the error
}

# Evaluate the array result and store it. (Please don't use this line in production code) as the $result string is from a untrusted source
eval('$array = '.$result.';');

# Then you can, for example, get a list of the types
$types = $array[0]['RESULT']['TYPES'];
echo $types
# Or some keys
$keys = array_keys($array[0]['RESULT']);
echo $keys

#!/bin/bash
SWUL=$(softwareupdate -l | awk '{printf "%s", $0}')
SWULER=$(softwareupdate -l 2>&1 | head -1)
NoRestartUpdates=$(softwareupdate -l | grep -v restart | grep -B1 recommended | grep -v recommended | awk '{print $2}' | awk '{printf "%s ", $0}')
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ $osvers -lt 8 ]]; then
  /bin/echo "Script only for 10.8+ ONLY"
  exit 1
elif [ "$SWULER" == "No new software available." ]; then
  /bin/echo "$SWULER"
  exit 1
elif [[ "$SWUL" == *"[restart]"* ]]; then
  echo "Installing Updates that require Restart"
  sudo softwareupdate -d -a
  /usr/libexec/PListBuddy -c "Copy CompletedProducts InstallAtLogout" /Library/Updates/index.plist
  touch /var/db/.SoftwareUpdateAtLogout
  chmod og-r /var/db/.SoftwareUpdateAtLogout
  /usr/libexec/PListBuddy -c "Add -RootInstallMode STRING YES" /var/db/.SoftwareUpdateOptions
  /usr/libexec/PListBuddy -c "Add -SkipConfirm STRING YES" /var/db/.SoftwareUpdateOptions
  chmod og-r /var/db/.SoftwareUpdateOptions
elif [[ "$SWUL" == *"[recommended]"* ]]; then
  /bin/echo "Installing Updates that does not require Restart"
  sudo softwareupdate -i $NoRestartUpdates
fi

exit 0
