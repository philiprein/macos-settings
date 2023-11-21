#!/bin/zsh

echo "Notifications settings..."

# show previews
# 1 = never
# 2 = if unlocked
# 3 = always
defaults write /Users/"$USER"/Library/Preferences/com.apple.ncprefs.plist content_visibility -int 2

# do not allow notifications when the display is sleeping
# allow notifications when the screen is locked
# allow notifications when mirroring or sharing the display
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

defaults write com.apple.ncprefs.plist dnd_prefs -data "$DND_HEX_DATA"
killall cfprefsd; while [[ $(ps aux | grep cfprefsd | grep -v grep | awk '{print $2;}') == "" ]]; do sleep 0.5; done
killall usernoted; while [[ $(ps aux | grep usernoted | grep -v grep | awk '{print $2;}') == "" ]]; do sleep 0.5; done

### per app notification settings
# see seperate script

### hidden notification center tweaks
    
# change notification banner persistence time (value in seconds)
# defaults write com.apple.notificationcenterui bannerTime 15

# reset default notification banner persistence time
# defaults delete com.apple.notificationcenterui bannerTime