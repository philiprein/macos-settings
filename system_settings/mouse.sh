#!/bin/zsh

echo "Mouse settings..."

# tracking speed (default: 0.6875)
defaults write NSGlobalDomain com.apple.mouse.scaling 0.875

# natural scrolling (default: off)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# secondary click (default: click right side)
# click right side = false
# click left side = true
defaults -currentHost write NSGlobalDomain com.apple.mouse.swapLeftRightButton -bool false

# double-click speed (default: 0.5)
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.5

# scrolling speed (default: 0.3125)
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0.75