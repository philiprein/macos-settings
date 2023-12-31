#!/bin/zsh

echo "Desktop & Dock settings..."

### dock

# size (default: 64)
defaults write com.apple.dock tilesize -int 42

# magnification (default: off)
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80

# position on screen (default: bottom)
# left = left
# bottom = bottom
# right = right
defaults write com.apple.dock orientation -string "bottom"

# minimize windows using (default: genie effect)
# genie effect = genie
# sacle effect = scale
defaults write com.apple.dock mineffect -string "scale"

# double-click a windows's title bar to (default: zoom)
# minimize = true
# zoom = false
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# minimize windows into applications icon (default: off)
defaults write com.apple.dock minimize-to-application -bool false

# automatically hide and show the dock (default: off)
defaults write com.apple.dock autohide -bool true

# animate opening applications (default: on)
defaults write com.apple.dock launchanim -bool true

# show indicators for open applications (default: on)
defaults write com.apple.dock show-process-indicators -bool true

# show suggested and recent applications in dock (default: on)
defaults write com.apple.dock show-recents -bool true


### hidden dock tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# highlight hover effect for the grid view of a stack (default: off)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# spring loading for all dock items (default: off)
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool false

# dock icons of hidden (⌘ + H) applications are translucent (default: off)
defaults write com.apple.dock showhidden -bool true

# only open applications show up in the dock (default: off)
defaults write com.apple.dock static-only -bool false

# no bouncing icons when apps need your attention (default: off)
defaults write com.apple.dock no-bouncing -bool false

# auto-hiding dock delay
defaults write com.apple.dock autohide-delay -float 0

# animation when hiding/showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0

# scroll up on dock icon to show all space's opened windows for an app, or open stack
defaults write com.apple.dock scroll-to-open -bool true


### desktop & stage manager

# show items (default: on desktop)
# off
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool true
defaults write com.apple.WindowManager HideDesktop -bool true
# on desktop
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool false
defaults write com.apple.WindowManager HideDesktop -bool true
# in stage manager
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool true
defaults write com.apple.WindowManager HideDesktop -bool false
# on desktop & in stage manager
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool false
defaults write com.apple.WindowManager HideDesktop -bool false

# click wallpaper to reveal desktop (default: always)
# always = true
# only in stage manager = false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool true

# stage manager (default: off)
defaults write com.apple.WindowManager GloballyEnabled -bool false

# show recent apps in stage manager (default: on)
# on = false
# off = true
defaults write com.apple.WindowManager AutoHide -bool false

# show windows from an application (default: all at once)
# all at once = 1
# one at a time = 0
defaults write com.apple.WindowManager AppWindowGroupingBehavior -int 1


### widgets

# show widgets (default: on desktop & in stage manager)
# off
defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true
# on desktop
defaults write com.apple.WindowManager StandardHideWidgets -bool false
defaults write com.apple.WindowManager StageManagerHideWidgets -bool true
# in stage manager
defaults write com.apple.WindowManager StandardHideWidgets -bool true
defaults write com.apple.WindowManager StageManagerHideWidgets -bool false
# on desktop & in stage manager
defaults write com.apple.WindowManager StandardHideWidgets -bool false
defaults write com.apple.WindowManager StageManagerHideWidgets -bool false

# widget style (default: automatic)
# automatic = 2
# monochrome = 0
# full-color = 1
defaults write com.apple.widgets widgetAppearance -int 2

# use iphone widgets (default: on)
defaults write com.apple.chronod remoteWidgetsEnabled -bool true
defaults write com.apple.chronod effectiveRemoteWidgetsEnabled -bool true

# default web browser
# TODO


### windows

# prefer tabs when opening documents (default: in full screen)
# never = manual
# always = always
# in full screen = fullscreen
defaults write NSGlobalDomain AppleWindowTabbingMode -string "fullscreen"

# ask to keep changes when closing documents (default: off)
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# close windows when quitting an application (default: on)
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true


### mission control

# automatically rearrange spaces based on most recent use (default: on)
defaults write com.apple.dock mru-spaces -bool false

# when switching to an application, switch to a space with open windows for the application (default: off)
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false

# group windows by application (default: off)
defaults write com.apple.dock expose-group-apps -bool true

# displays have separate spaces (default: on) (requires logout) 
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

# top left screen corner (default: off)
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-tl-modifier -int 1048576

# top right screen corner (default: off)
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0

# bottom left screen corner (default: off)
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 0

# bottom right screen corner (default: quick note)
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 0


### hidden desktop & dock tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# speed up mission control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1