#!/bin/zsh

echo "Sound settings..."

# disable sound effect on boot
# %00 = on, %01 = off
sudo nvram StartupMute=%01

### sound effects

# select an alert sound, e.g. "Sosumi"
#defaults write NSGlobalDomain com.apple.sound.beep.sound -string "/System/Library/Sounds/Sosumi.aiff"

# play sound on startup
# %00 = on
# %01 = off
sudo nvram StartupMute=%01

# play user interface sound effects
# 1 = yes, 0 = no
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -int 1

# play feedback when volume is changed
# 1 = yes, 0 = no
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 1

### output & input



### hidden sound tweaks

# increase sound quality for Bluetooth headphones/headsets
# requires higher bandwith, might have a negative effect on stability of the Bluetooth connection
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40