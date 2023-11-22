#!/bin/zsh

echo "Sound settings..."

### sound effects

# alert sound
# select an alert sound and check name with 
# defaults read NSGlobalDomain com.apple.sound.beep.sound
defaults write NSGlobalDomain com.apple.sound.beep.sound -string "/System/Library/Sounds/Bottle.aiff"

# play sound effects through (default: selected sound output device)
# TODO

# alert volume (default: 1)
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 1

# play sound on startup (default: on)
# on = %00
# off = %01
sudo nvram StartupMute=%00

# play user interface sound effects (default: on)
# on = 1
# off = 0
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 1

# play feedback when volume is changed (default: off)
# on = 1
# off = 0
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0


### output & input

# output volume
# TODO

# mute
# TODO

# balance
# TODO


### hidden sound tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# increase sound quality for bluetooth headphones/headsets
# requires higher bandwith, might have a negative effect on stability of the bluetooth connection
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40