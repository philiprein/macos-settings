#!/bin/zsh

echo "Lock Screen settings..."

# start screen saver when inactive (default: 20 minutes)
# time in seconds
# never = 0
defaults -currentHost write com.apple.screensaver idleTime -int 0

# turn display off on battery when inactive (default: 2 minutes)
# time in minutes
# never = 0
sudo pmset -b displaysleep 5

# turn display off on power adapter when inactive (default: 10 minutes)
# time in minutes
# never = 0
sudo pmset -c displaysleep 20

# require password after screen saver begins or display is turned off (default: after 5 minutes)
# TODO
# this no longer works as of macos 10.13
# https://stackoverflow.com/questions/45867402/macos-10-13-high-sierra-no-longer-stores-screensaver-settings-in-com-apple-scr
# defaults -currentHost write com.apple.screensaver askForPassword -int 0
# defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 0
# this sets value to immediately in both cases
# sudo osascript -e 'tell application "System Events" to set require password to wake of security preferences to true'
# sudo osascript -e 'tell application "System Events" to set require password to wake of security preferences to false'

# show large clock (default: on lock screen)
# on screen saver and lock screen = true, true
# on lock screen = true, false
# never = false, false
sudo defaults write /Library/Preferences/com.apple.loginwindow UsesLargeDateTime -bool true
defaults -currentHost write com.apple.screensaver showClock -bool false

# show user name and photo (default: on)
# on = false
# off = true
sudo defaults write /Library/Preferences/com.apple.loginwindow HideUserAvatarAndName -bool false

# show password hints (default: off)
# on = 3
# off = 0
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# show message when locked (default: off)
# on = "Message"
# off = ""
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string ""

# when switching user (default: list of users)
# login window shows
# list of users = false
# name and password = true
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false

# show the sleep, restart, and shut down buttons (default: on)
# on = false
# off = true
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

### accessibility options...
# disable all
sudo defaults write /Library/Preferences/com.apple.loginwindow UseVoiceOverAtLoginwindow -bool false
sudo defaults delete /Library/Preferences/com.apple.loginwindow accessibilitySettings

# voiceover (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow UseVoiceOverAtLoginwindow -bool true
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add voiceOverOnOffKey 1

# zoom (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewHotkeysEnabled 1
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewScrollWheelToggle 1
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewTrackpadGestureZoomEnabled 1

# accessibility keyboard (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add virtualKeyboardOnOff 1
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellActionType 2
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellAlwaysShowMenuExtra 0
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellEnabled 0
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellHideUITimeout 15

# sticky keys (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add stickyKey 1

# slow keys (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add slowKey 1

# mouse keys (default: off)
sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add mouseDriver 1

# make changes take effect (in GUI)
sudo defaults read /Library/Preferences/com.apple.loginwindow &>/dev/null

### hidden lock screen tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# reopen all windows after next login (default: on)
# false = disable, true = enable
defaults write com.apple.loginwindow TALLogoutSavesState -bool true

# show input sources on login window
# seems to be shown regardless
# sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool false
