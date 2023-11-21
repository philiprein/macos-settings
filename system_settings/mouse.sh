#!/bin/zsh

echo "Mouse settings..."

# tracking speed
defaults write NSGlobalDomain com.apple.mouse.scaling 0.875

# natural scrolling
# this seems to only affect trackpads -> see trackpad.sh
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# secondary click
defaults -currentHost write NSGlobalDomain com.apple.mouse.swapLeftRightButton -bool false

# double-click speed
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.5

# scrolling speed
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.75