#!/bin/zsh

echo "Bluetooth settings..."

# bluetooth (default: on)
# TODO


### advanced...

# open bluetooth assistant on boot if no keyboard is detected (default: on)
# doesn't work permanently; setting will be reset when pref pane in system settins is opened
# TODO
# sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist BluetoothAutoSeekKeyboard -bool false

# open bluetooth assistant on boot if no mouse or trackpad is detected (default: on)
# doesn't work permanently; setting will be reset when pref pane in system settins is opened
# TODO
# sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist BluetoothAutoSeekPointingDevice -bool false


### hidden bluetooth tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# allow bluetooth devices to wake up the mac
# doesn't seem to work anymore...
# defaults -currentHost write com.apple.bluetooth RemoteWakeEnabled -boolean true
