#!/bin/zsh

echo "Focus settings..."

### do not disturb
    
# from macos 12 on the easiest way to toggle dnd on the command line seems to be the shortcuts.app
# https://github.com/sindresorhus/do-not-disturb/issues/9#issuecomment-981590804
# https://github.com/vitorgalvao/tiny-scripts/issues/206#issuecomment-974747114

# open shortcuts
# add shortcut - name dnd-on
# add action focus on until switched off
# add shortcut - name dnd-off
# add action focus off until switched on

# check_dnd_status() {
#   # check dnd state
#   # 0 = off
#   # 1 = on
#   DND_STATUS=$(defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes")
# }

# enable_dnd() {
#     echo "enabling dnd..."
#   if [[ -e "/System/Applications/Shortcuts.app" ]] && [[ $(shortcuts list | grep -x "dnd-on") != "" ]] 
#   then
#     shortcuts run dnd-on
#     sleep 1
#     defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes"
#   else
#     echo "shortcuts app or shortcuts name not found..."
#   fi
# }

# disable_dnd() {
#     echo "disabling dnd..."
#   if [[ -e "/System/Applications/Shortcuts.app" ]] && [[ $(shortcuts list | grep -x "dnd-off") != "" ]] 
#   then
#     shortcuts run dnd-off
#     sleep 1
#     defaults read com.apple.controlcenter "NSStatusItem Visible FocusModes"
#   else
#     echo "shortcuts app or shortcuts name not found..."
#   fi
# }


# share across devices (default: on) (needs logout)
# share = false
# do not share = true
defaults write com.apple.donotdisturbd disableCloudSync -bool true


### focus status

# share focus status (default: on)
# TODO

# share from
# TODO