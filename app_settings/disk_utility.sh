#!/bin/zsh

echo "Disk Utility settings..."

### view settings

# show all devices (default: off)
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true