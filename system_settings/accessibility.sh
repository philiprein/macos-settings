#!/bin/zsh

echo "Accessibility settings..."

# TODO
# These are far from complete... however, most people never touch them anyway

### voiceover

# voiceover 
defaults write com.apple.universalaccess voiceOverOnOffKey -bool false

### zoom

# use keyboard shortcuts to zoom
defaults write com.apple.universalaccess closeViewHotkeysEnabled -bool false

# use trackpad gesture to zoom
defaults write com.apple.universalaccess closeViewTrackpadGestureZoomEnabled -bool false

# use scroll gesture with modifier keys to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool false

# modifier key for scroll gesture
# Control = 262144
# Option = 524288
# Command = 1048576
defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144


### display



### spoken content



### descriptions



### audio



### rtt



### captions



### voice control



### keyboard

# full keyboard access
# 2 = on
# 0 = off
defaults write NSGlobalDomain AppleKeyboardUIMode -int 0


### pointer control

# spring-loading
# i.e. drag something over a directory to open it automatically
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# spring-loading speed
defaults write NSGlobalDomain com.apple.springing.delay -float 0.3


### switch control



### siri



### shortcut


