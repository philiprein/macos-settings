#!/bin/zsh

echo "Control Center settings..."

### control center modules

# changes to defaults -currentHost write com.apple.controlcenter have to be made
# before changing defaults write com.apple.controlcenter to make the changes take effect
# changes to defaults -currentHost write com.apple.controlcenter seem to also affect defaults write com.apple.controlcenter

# wifi (default: show in menu bar)
# show in menu bar = 2, true
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter WiFi -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false

# bluetooth (default: don't show in menu bar)
# show in menu bar = 18, true
# don't show in menu bar = 24, false
defaults -currentHost write com.apple.controlcenter Bluetooth -int 24
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false

# airdrop (default: don't show in menu bar)
# show in menu bar = 2, true
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter AirDrop -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool false

# focus (default: show when active)
# always show in menu bar = 18, true
# show when active = 2
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter FocusModes -int 2
# defaults write com.apple.controlcenter "NSStatusItem Visible FocusModes" -bool false

# stage manager (default: don't show in menu bar)
# show in menu bar = 2, true
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter StageManager -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible StageManager" -bool false

# screen mirroring (default: show when active)
# always show in menu bar = 18, true
# show when active = 2
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter ScreenMirroring -int 2
# defaults write com.apple.controlcenter "NSStatusItem Visible ScreenMirroring" -bool false

# display (default: show when active)
# always show in menu bar = 18, true
# show when active = 2
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter Display -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible Display" -bool false

# sound (default: show when active)
# always show in menu bar = 18, true
# show when active = 2
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter Sound -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool false

# now playing (default: show when active)
# always show in menu bar = 18, true
# show when active = 2
# don't show in menu bar = 8, false
defaults -currentHost write com.apple.controlcenter NowPlaying -int 8
defaults write com.apple.controlcenter "NSStatusItem Visible NowPlaying" -bool false

### other modules

# show in menu bar & show in control center = 3, true
# show in menu bar & don't show in control center = 6, true
# don't show in menu bar & show in control center = 9, false
# don't show in menu bar & don't show in control center = 12, false

# accessibility shortcuts (default: don't show in menu bar & don't show in control center)
defaults -currentHost write com.apple.controlcenter AccessibilityShortcuts -int 12
defaults write com.apple.controlcenter "NSStatusItem Visible AccessibilityShortcuts" -bool false

# battery (default: show in menu bar & don't show in control center)
defaults -currentHost write com.apple.controlcenter Battery -int 12
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool false
# show percentage (default: off)
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -bool true

# hearing (default: don't show in menu bar & don't show in control center)
defaults -currentHost write com.apple.controlcenter Hearing -int 12
defaults write com.apple.controlcenter "NSStatusItem Visible Hearing" -bool false

# fast user switching (default: don't show in menu bar & don't show in control center)
defaults -currentHost write com.apple.controlcenter UserSwitcher -int 12
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -bool false

# keyboard brightness (default: don't show in menu bar & don't show in control center)
defaults -currentHost write com.apple.controlcenter KeyboardBrightness -int 12
defaults write com.apple.controlcenter "NSStatusItem Visible KeyboardBrightness" -bool false

### menu bar only

# clock options

# show date (default: 0)
# when space allows = 0
# always = 1
# never = 2
defaults write com.apple.menuextra.clock ShowDate -int 0

# show the day of the week (default: on)
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

# style (default: false)
defaults write com.apple.menuextra.clock IsAnalog -bool false

# use a 24-hour clock
# no longer visible in macOS Sonoma
defaults write com.apple.menuextra.clock Show24Hour -bool true

# show am/pm (default: false)
defaults write com.apple.menuextra.clock ShowAMPM -bool false

# flash the time separators (default: false)
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# display the time with seconds (default: false)
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# announce the time (default: false)
defaults write com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsEnabled -bool false

# interval (default: EveryHourInterval)
# on the hour = EveryHourInterval
# on the half hour = EveryHalfHourInterval
# on the quarter hour = EveryQuarterHourInterval
defaults write com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsIntervalIdentifier -string "EveryHourInterval"

# spotlight (default: show in menu bar)
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# siri (default: don't show in menu bar)
# show in menu bar
# defaults write com.apple.Siri StatusMenuVisible -bool true
# don't show in menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults delete com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false

# time machine (default: don't show in menu bar) & vpn (default: don't show in menu bar)
# first delete all entries from the menuExtras array
defaults delete com.apple.systemuiserver.plist menuExtras 2>/dev/null
# delete visibility status
defaults delete com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" 2>/dev/null
defaults delete com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.vpn" 2>/dev/null
# add the entries you wish to see
defaults write com.apple.systemuiserver.plist menuExtras -array-add "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
defaults write com.apple.systemuiserver.plist menuExtras -array-add "/System/Library/CoreServices/Menu Extras/VPN.menu"

# automatically hide and show the menu bar (default: in full screen only)
# always = 0, 1
# on desktop only = 1, 1
# in full screen only = 0, 0
# never = 1, 0
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 0
defaults write NSGlobalDomain _HIHideMenuBar -int 0

# recent documents, applications, and servers (default: 10)
defaults write NSGlobalDomain NSRecentDocumentsLimit 10

# make changes take effect
# killall SystemUIServer -HUP
