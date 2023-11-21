#!/bin/zsh

echo "Displays settings..."

# settings here depend on the displays connected to the mac

# true tone
# TODO
# sudo defaults read /var/root/Library/Preferences/com.apple.CoreBrightness.plist
# true tone = CBColorAdaptationEnabled = 1 
# auto brightness = AutoBrightnessEnable = 1    

# show file content
# sudo plutil -p /var/root/Library/Preferences/com.apple.CoreBrightness.plist

# the respective values are in sub-levels with complex unidentified numbers 
# they can therefore not be edited directly with the defaults command

# workaround
# converting binary plist to xml
# change values
# convert back to binary plist
# changes get applied during reboot

# if [[ -e /Users/"$USER"/Desktop/CoreBrightness_work.plist ]]
# then
#   rm -f /Users/"$USER"/Desktop/CoreBrightness_work.plist
# else
#   :
# fi

# sudo plutil -convert xml1 /var/root/Library/Preferences/com.apple.CoreBrightness.plist -o /Users/"$USER"/Desktop/CoreBrightness_work.plist

# sed -i '' "/<key>CBColorAdaptationEnabled<\/key>/,/<\/dict>/ s/<integer>0<\/integer>/<integer>1<\/integer>/g;" /Users/"$USER"/Desktop/CoreBrightness_work.plist
# sed -i '' "/<key>AutoBrightnessEnable<\/key>/,/<key>/ s/<false\/>/<true\/>/g;" /Users/"$USER"/Desktop/CoreBrightness_work.plist

# if [[ -e /Users/"$USER"/Desktop/CoreBrightness_work.plist ]] && [[ $(sudo plutil -lint /Users/"$USER"/Desktop/CoreBrightness_work.plist | grep '.plist: OK') != "" ]]
# then
#   sudo rm -f /var/root/Library/Preferences/com.apple.CoreBrightness.plist
#   sudo plutil -convert binary1 /Users/"$USER"/Desktop/CoreBrightness_work.plist -o /var/root/Library/Preferences/com.apple.CoreBrightness.plist
#   sudo chown root:wheel /var/root/Library/Preferences/com.apple.CoreBrightness.plist
#   sudo chmod 600 /var/root/Library/Preferences/com.apple.CoreBrightness.plist
#   rm -f /Users/"$USER"/Desktop/CoreBrightness_work.plist
# else
#   :
# fi

# enable HiDPI display modes for non retina displays (requires restart) 
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# show monitor sync options in menu bar if available
defaults write com.apple.airplay showInMenuBarIfPresent -bool true

### advanced...

# show resolutions as list
# TODO

# allow your pointer and keyboard to move between any nearby mac or ipad
# defaults -currentHost write com.apple.universalcontrol Disable -bool true

# push through the edge of a display to connect a nearby mac or ipad
# doesn't apply if the previous setting is set to true
# defaults -currentHost write com.apple.universalcontrol DisableMagicEdges -bool true

# automatically reconnect to any nearby mac or ipad
# TODO
# seems to be an entry in /Users/$USER/Library/SyncedPreferences/com.apple.kvs/com.apple.KeyValueService.EndToEndEncrypted-Production.sqlite

# slightly dim the display on battery
# on = 1
# off = 0
# sudo pmset -b lessbright 0
# sudo pmset -c lessbright 0

# prevent automatic sleeping on power adapter when the display is off
# should only be used with disksleep 0
# on = 1
# off = 0
# sudo pmset -c sleep 0

# prevent automatic sleeping on battery when the display is off
# should only be used with disksleep 0
# sudo pmset -b sleep 0


### night shift

# TODO
# sudo defaults read /var/root/Library/Preferences/com.apple.CoreBrightness.plist

# not sure which value corresponds to which setting
# my guesses are

# schedule (BlueReductionMode)
# off = 0
# custom = 2 (NightStartHour & DayStartHour are the custom times set)
# sunset to sunrise = 1

# turn on until tomorrow (BlueLightReductionAlgoOverride)
# on = 4
# off = 0
# BlueLightReductionAlgoOverrideTimestamp gets set

# color temperature (CBBlueLightReductionCCTTargetRaw)
# e. g. 3792.336

# the respective values are in sub-levels with complex unidentified numbers 
# they can therefore not be edited directly with the defaults command


### sidecar

# these settings are only visible when you have a device connected via sidecar

# sidebar
# disable sidebar
# defaults delete com.apple.sidecar.display sidebarRight &>/dev/null
# defaults write com.apple.sidecar.display sidebarShown -bool false

# show sidebar left
defaults delete com.apple.sidecar.display sidebarRight &>/dev/null
defaults write com.apple.sidecar.display sidebarShown -bool true

# show sidebar right
# defaults write com.apple.sidecar.display sidebarRight -bool true
# defaults write com.apple.sidecar.display sidebarShown -bool true

# touchbar
# disable touchbar
defaults delete com.apple.sidecar.display touchBarTop &> /dev/null
defaults write com.apple.sidecar.display showTouchbar -bool false    

# show touchbar bottom
# defaults delete com.apple.sidecar.display touchBarTop &> /dev/null
# defaults write com.apple.sidecar.display showTouchbar -bool true

# show touchbar top
# defaults write com.apple.sidecar.display touchBarTop -bool true
# defaults write com.apple.sidecar.display showTouchbar -bool true

# double tap on apple pencil
defaults write com.apple.sidecar.display doubleTapEnabled -bool false