#!/bin/zsh

echo "Bluetooth settings..."

### advanced...

# open bluetooth assistant on boot if no keyboard is detected
# doesn't work permanently; setting will be reset when pref pane in system settins is opened
# TODO
# sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist BluetoothAutoSeekKeyboard -bool false

# open bluetooth assistant on boot if no mouse or trackpad is detected
# doesn't work permanently; setting will be reset when pref pane in system settins is opened
# TODO
# sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist BluetoothAutoSeekPointingDevice -bool false


### hidden bluetooth tweaks

# allow bluetooth devices to wake up the mac
defaults -currentHost write com.apple.bluetooth RemoteWakeEnabled -boolean true