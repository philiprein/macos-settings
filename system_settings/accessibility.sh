#!/bin/zsh

echo "Accessibility settings..."

### voiceover

# voiceover (default: off)
defaults write com.apple.universalaccess voiceOverOnOffKey -bool false


### zoom
# TODO

# use keyboard shortcuts to zoom (default: off)
defaults write com.apple.universalaccess closeViewHotkeysEnabled -bool false

# use trackpad gesture to zoom (default: off)
defaults write com.apple.universalaccess closeViewTrackpadGestureZoomEnabled -bool false

# use scroll gesture with modifier keys to zoom (default: off)
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool false

# modifier key for scroll gesture (default: 262144)
# Control = 262144
# Option = 524288
# Command = 1048576
defaults write com.apple.universalaccess closeViewScrollWheelModifiersInt -int 262144


### display
# TODO


### spoken content
# TODO


### descriptions
# TODO


### audio
# TODO


### rtt
# TODO


### captions
# TODO


### voice control
# TODO


### keyboard
# TODO


### pointer control
# TODO

# spring-loading (default: on)
# i.e. drag something over a directory to open it automatically
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# spring-loading speed (default: 0.5)
defaults write NSGlobalDomain com.apple.springing.delay -float 0.3


### switch control
# TODO


### siri
# TODO


### shortcut
# TODO