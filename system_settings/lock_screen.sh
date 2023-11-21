#!/bin/zsh

echo "Lock Screen settings..."

# start screen saver when inactive
# time in seconds
# never = 0
defaults -currentHost write com.apple.ScreenSaver idleTime -int 0

# turn display off on battery when inactive
# time in minutes
# never = 0
sudo pmset -b displaysleep 10

# turn display off on power adapter when inactive
# time in minutes
# never = 0
sudo pmset -c displaysleep 20

# require password after screen saver begins or display is turned off
# TODO
# this no longer works as of macos 10.13
# https://stackoverflow.com/questions/45867402/macos-10-13-high-sierra-no-longer-stores-screensaver-settings-in-com-apple-scr
# defaults -currentHost write com.apple.screensaver askForPassword -int 0
# defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 0
# this sets the setting to immediately in both cases
# sudo osascript -e 'tell application "System Events" to set require password to wake of security preferences to true'
# sudo osascript -e 'tell application "System Events" to set require password to wake of security preferences to false'

# show message when locked
# set to empty string to disable
sudo defaults write /Library/Preferences/com.apple.loginwindow "LoginwindowText" ''

# user switching
# login window shows
# list of users = false
# name and password = true
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false

# show the sleep, restart, and shut down buttons
sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# show password hints
# disable = 0
# enable = 3
sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0


### accessibility options...
# disable
sudo defaults write /Library/Preferences/com.apple.loginwindow UseVoiceOverAtLoginwindow -bool false
sudo defaults delete /Library/Preferences/com.apple.loginwindow accessibilitySettings

# voiceover
# sudo defaults write /Library/Preferences/com.apple.loginwindow UseVoiceOverAtLoginwindow -bool true
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add voiceOverOnOffKey 1

# zoom
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewHotkeysEnabled 1 
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewScrollWheelToggle 1
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add closeViewTrackpadGestureZoomEnabled 1

# accessibility keyboard
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add virtualKeyboardOnOff 1
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellActionType 2
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellAlwaysShowMenuExtra 0
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellEnabled 0
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add dwellHideUITimeout 15

# sticky keys
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add stickyKey 1

# slow keys
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add slowKey 1

# mouse keys
# sudo defaults write /Library/Preferences/com.apple.loginwindow accessibilitySettings -dict-add mouseDriver 1

# make changes take effect (in GUI)
# sudo defaults read /Library/Preferences/com.apple.loginwindow &>/dev/null


### hidden lock screen tweaks

# show input sources on login window
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool false