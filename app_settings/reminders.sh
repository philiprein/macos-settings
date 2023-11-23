#!/bin/zsh

echo "Reminders settings..."

# default list
# TODO

# all-day reminders (default: on, 9:00)
# disable = -1
# enable, e.g. 09:00 = 900
defaults write com.apple.remindd todayNotificationFireTime -int -1

# show all-day reminders as overdue (default: on)
defaults write com.apple.remindd showRemindersAsOverdue -bool false

# badge count: include due today (default: off)
defaults write com.apple.remindd shouldIncludeRemindersDueTodayInBadgeCount -bool true

# assigned reminders (default: off)
# mute = false
# don't mute = true
defaults write com.apple.remindd enableAssignmentNotifications -bool true

# adding reminders (default: on)
# show suggestions
# don't show suggestions
defaults write com.apple.remindd enableAutoCompleteReminders -bool false