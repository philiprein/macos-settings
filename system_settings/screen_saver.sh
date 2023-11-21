#!/bin/zsh

echo "Screen Saver settings..."

# read defaults -currentHost read com.apple.screensaver moduleDict

# non-random, e. g. "Hello"
# defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Hello" path -string "/System/Library/Screen Savers/Hello.saver" type -int 0

# random
# defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Random" path -string "/System/Library/Screen Savers/Random.saver" type -int 8

# show with clock
defaults -currentHost write com.apple.screensaver showClock -bool false