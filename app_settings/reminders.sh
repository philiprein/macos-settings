#!/bin/zsh

echo "Reminders settings..."

# default list
# TODO

# all-day reminders
# disable = -1
# enable, e.g. 09:00 = 900
defaults write com.apple.remindd todayNotificationFireTime -int -1

# show all-day reminders as overdue
defaults write com.apple.remindd showRemindersAsOverdue -bool false

# badge count: include due today
defaults write com.apple.remindd shouldIncludeRemindersDueTodayInBadgeCount -bool true

# assigned reminders
# mute = false
# don't mute = true
defaults write com.apple.remindd enableAssignmentNotifications -bool true