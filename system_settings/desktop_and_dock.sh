#!/bin/zsh

echo "Desktop & Dock settings..."

### dock

# size
defaults write com.apple.dock tilesize -int 42

# magnification
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80

# position on screen
# options: left, bottom, right
defaults write com.apple.dock orientation -string "bottom"

# minimize windows using
# options: scale, genie
defaults write com.apple.dock mineffect -string "scale"

# double-click a windows's title bar to
# minimize = true
# zoom = false
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# minimize windows into applications icon
defaults write com.apple.dock minimize-to-application -bool false

# automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# animate opening applications
defaults write com.apple.dock launchanim -bool true

# show recent applications in dock
defaults write com.apple.dock show-recents -bool true

### hidden dock tweaks

# highlight hover effect for the grid view of a stack
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# spring loading for all dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool false

# indicator lights for open applications in the dock
defaults write com.apple.dock show-process-indicators -bool true

# dock icons of hidden (⌘ + H) applications are translucent
defaults write com.apple.dock showhidden -bool true

# only open applications show up in the dock
# defaults write com.apple.dock static-only -bool false

# bouncing icons when apps need your attention
defaults write com.apple.dock no-bouncing -bool false

# auto-hiding dock delay
defaults write com.apple.dock autohide-delay -float 0

# animation when hiding/showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0

# scroll up on dock icon to show all space's opened windows for an app, or open stack
defaults write com.apple.dock scroll-to-open -bool true


### menu bar

# automatically hide and show the menu bar
# always = 0, 1
# on desktop only = 1, 1
# in full screen only = 0, 0
# never = 1, 0
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 0
defaults write NSGlobalDomain _HIHideMenuBar -int 0

# recent documents, applications, and servers
defaults write NSGlobalDomain NSRecentDocumentsLimit 10


### windows & apps

# prefer tabs when opening documents
# options: always, fullscreen or manual
defaults write NSGlobalDomain AppleWindowTabbingMode -string "fullscreen"

# ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# close windows when quitting an application
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# stage manager
defaults write com.apple.WindowManager GloballyEnabled -bool false

# if enabled:
# recent applications
defaults write com.apple.WindowManager AutoHide -bool false

# desktop items
defaults write com.apple.WindowManager HideDesktop -bool true

# show windows from an application
# all at once = 1
# one at a time = 0
defaults write com.apple.WindowManager AppWindowGroupingBehavior -int 0

# default web browser
# TODO
# seperate script?


### mission control

# automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# when switching to an application, switch to a space with open windows for that application
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false

# group windows by application
defaults write com.apple.dock expose-group-apps -bool true

# displays have separate spaces (requires log out)
defaults write com.apple.spaces spans-displays -bool true


### shortcuts

# for other shortcuts see keyboard.sh

# mission control = 32
# application windows = 33
# show desktop = 36

# F9 = 101
# F10 = 109
# F11 = 103
# F12 = 111

# no modifier = 0
# shift = 131072
# control = 262144
# option = 524288
# command = 1048576

# examples
# disable mission control shortcut
# defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 32 "<dict><key>enabled</key><false/></dict>"

# enable application windows on F10
# defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 33 "
#   <dict>
#     <key>enabled</key>
#     <true/>
#     <key>value</key>
#     <dict>
#       <key>parameters</key>
#       <array>
#         <integer>65535</integer>
#         <integer>109</integer>
#         <integer>0</integer>
#       </array>
#       <key>type</key>
#       <string>standard</string>
#     </dict>
#   </dict>
# "

# or
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Delete AppleSymbolicHotKeys:32'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:enabled bool true'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:value:type string standard'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:value:parameters array'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:value:parameters:"Item 0" integer 0'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:value:parameters:"Item 1" integer 101'
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c 'Add AppleSymbolicHotKeys:32:value:parameters:"Item 2" integer 65535'


### hidden mission control tweaks

# speed up mission control animations
defaults write com.apple.dock expose-animation-duration -float 0.1
    

### hot corners

# off = 1
# mission control = 2
# application windows = 3
# desktop = 4
# screen saver on = 5
# screen saver off = 6
# display sleep = 10
# launchpad = 11
# notification center = 12
# lock screen = 13
# quick note = 14

# no modifier = 0
# shift = 131072
# control = 262144
# option = 524288
# command = 1048576

# top left screen corner
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-tl-modifier -int 1048576

# top right screen corner
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0

# bottom left screen corner
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 0

# bottom right screen corner
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0