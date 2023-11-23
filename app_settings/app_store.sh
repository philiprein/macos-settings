#!/bin/zsh

echo "App Store settings..."

# automatic updates (default: off)
# set in general.sh or system settings -> general -> softwareupdate

# automatically download apps purchased on other devices (default: off)
# TODO

# automatically download in-app content (default: on)
defaults write com.apple.appstored BackgroundAssetDownloadsEnabled -bool true

# video autoplay (default: on)
# on = on
# off = off
defaults write com.apple.AppStore AutoPlayVideoSetting -string "off"
defaults write com.apple.AppStore UserSetAutoPlayVideoSetting -bool true

# in app reviews (default: on) (needs reboot)
defaults write com.apple.AppStore InAppReviewEnabled -bool false


### hidden app store tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not
    
# check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# enable the webkit developer tools in the mac app store
defaults write com.apple.AppStore WebKitDeveloperExtras -bool true

# enable debug menu in the mac app store
defaults write com.apple.AppStore ShowDebugMenu -bool true