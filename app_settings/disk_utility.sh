#!/bin/zsh

echo "Disk Utility settings..."

### view settings

# show all devices (default: off)
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true


### hidden disk utility tweaks 

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# enable the debug menu in disk utility
# defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
# defaults write com.apple.DiskUtility advanced-image-options -bool true