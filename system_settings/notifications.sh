#!/bin/zsh

echo "Notifications settings..."

# show previews (default: 2)
# 1 = never
# 2 = if unlocked
# 3 = always
defaults write com.apple.ncprefs content_visibility -int 2

# allow notifications when the display is sleeping (default: off)
# allow notifications when the screen is locked (default: on)
# allow notifications when mirroring or sharing the display (default: off)
# false = true in GUI
DND_HEX_DATA=$(echo '
  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
  <dict>
    <key>dndDisplayLock</key>
    <false/>
    <key>dndDisplaySleep</key>
    <true/>
    <key>dndMirrored</key>
    <true/>
    <key>facetimeCanBreakDND</key>
    <false/>
    <key>repeatedFacetimeCallsBreaksDND</key>
    <false/>
  </dict>
  </plist>' - -o - | plutil -convert binary1 - -o - | xxd -p | tr -d '\n')

defaults write com.apple.ncprefs dnd_prefs -data "$DND_HEX_DATA"

# for changes to take effect
killall cfprefsd
while [[ $(ps aux | grep cfprefsd | grep -v grep | awk '{print $2;}') == "" ]]; do sleep 0.5; done
killall usernoted
while [[ $(ps aux | grep usernoted | grep -v grep | awk '{print $2;}') == "" ]]; do sleep 0.5; done


### application notifications
# TODO


### hidden notification center tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# change notification banner persistence time (value in seconds)
# doesn't seem to work anymore
# defaults write com.apple.notificationcenterui bannerTime 15
