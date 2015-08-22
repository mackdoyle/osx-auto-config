#!/bin/bash

# Set source and target directories
# Replace below with this is it doesn't work : powerline_fonts_dir=$( cd "$( dirname "$0" )" && pwd )
powerline_fonts_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

find_command="find \"$powerline_fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p $font_dir
  if [ $? -ne 0 ]; then
    echo "failed to mkdir $TMP. Try executing: sudo chmod -R 755 $TMP" >&2
    exit 1
  fi
fi

# Copy all fonts to user fonts directory
eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

# Reset font cache on Linux
if [[ -n `which fc-cache` ]]; then
  fc-cache -f $font_dir
fi

echo "All Powerline fonts installed to $font_dir"
