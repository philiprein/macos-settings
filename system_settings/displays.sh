#!/bin/zsh

echo "Displays settings..."

# settings here depend on the displays connected to the mac

# automatically adjust brightness (default: on) & true tone (default: on)
# TODO
# show file content
# sudo plutil -p /var/root/Library/Preferences/com.apple.CoreBrightness.plist
# or
# sudo defaults read /var/root/Library/Preferences/com.apple.CoreBrightness.plist
# automatically adjust brightness = AutoBrightnessEnable
# true tone = CBColorAdaptationEnabled

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

# preset
# TODO

# refresh rate
# TODO


### advanced...

# show resolutions as list (default: off)
# TODO

# allow your pointer and keyboard to move between any nearby mac or ipad (default: on)
defaults -currentHost write com.apple.universalcontrol Disable -bool true

# push through the edge of a display to connect a nearby mac or ipad (default: on)
# doesn't apply if the previous setting is set to true
defaults -currentHost write com.apple.universalcontrol DisableMagicEdges -bool true

# automatically reconnect to any nearby mac or ipad (default: off)
# TODO
# seems to be an entry in /Users/$USER/Library/SyncedPreferences/com.apple.kvs/com.apple.KeyValueService.EndToEndEncrypted-Production.sqlite


### night shift
# TODO
# sudo defaults read /var/root/Library/Preferences/com.apple.CoreBrightness.plist
# the respective values are in sub-levels with complex unidentified numbers 
# they can therefore not be edited directly with the defaults command

# schedule (default: off)
# BlueReductionMode
# off = 0
# custom = 2 (NightStartHour & DayStartHour are the custom times set)
# sunset to sunrise = 1

# turn on until tomorrow (default: off)
# BlueLightReductionAlgoOverride
# on = 4
# off = 0
# BlueLightReductionAlgoOverrideTimestamp gets set

# color temperature (default: 4128.328 (?))
# CBBlueLightReductionCCTTargetRaw
# e. g. 3792.336


### sidecar

# these settings are only visible when you have a device connected via sidecar

# sidebar
# disable sidebar
# defaults delete com.apple.sidecar.display sidebarRight &>/dev/null
# defaults write com.apple.sidecar.display sidebarShown -bool false

# show sidebar left
defaults delete com.apple.sidecar.display sidebarRight
defaults write com.apple.sidecar.display sidebarShown -bool true

# show sidebar right
# defaults write com.apple.sidecar.display sidebarRight -bool true
# defaults write com.apple.sidecar.display sidebarShown -bool true

# touchbar
# disable touchbar
defaults delete com.apple.sidecar.display touchBarTop
defaults write com.apple.sidecar.display showTouchbar -bool false    

# show touchbar bottom
# defaults delete com.apple.sidecar.display touchBarTop &> /dev/null
# defaults write com.apple.sidecar.display showTouchbar -bool true

# show touchbar top
# defaults write com.apple.sidecar.display touchBarTop -bool true
# defaults write com.apple.sidecar.display showTouchbar -bool true

# double tap on apple pencil
defaults write com.apple.sidecar.display doubleTapEnabled -bool false


### hidden display tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# enable HiDPI display modes for non retina displays (requires restart) 
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# show monitor sync options in menu bar if available
# defaults write com.apple.airplay showInMenuBarIfPresent -bool true