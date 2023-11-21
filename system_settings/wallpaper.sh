#!/bin/zsh

echo "Wallpaper settings..."

# set desktop wallpaper

# show the currently active wallpaper (picture attribute)
# osascript -e 'tell application "System Events" to get properties of every desktop'

# set default desktop wallpaper
# DESKTOP_FILE="/System/Library/CoreServices/DefaultDesktop.heic"
# osascript -e "tell application \"System Events\" to set picture of every desktop to posix file \"$DESKTOP_FILE\""
# sleep 3
# unset DESKTOP_FILE