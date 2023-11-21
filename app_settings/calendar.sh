#!/bin/zsh

echo "Calendar settings..."

### general

# days per week
defaults write com.apple.iCal "n days of week" -int 7

# start week on
# system setting = 0
# sunday = 1
# monday = 2
# ...
# saturday = 7
defaults write com.apple.iCal "first day of week" -int 0

# scroll in week view by 
# day = 0
# week = 1
# week, stop on today = 2
defaults write com.apple.iCal "scroll by weeks in week view" -integer 1

# day starts at
# 06:00 = 360
# 08:00 = 480
# ...
defaults write com.apple.iCal "first minute of work hours" -integer 360

# day ends at
# midnight = 1440
defaults write com.apple.iCal "last minute of work hours" -integer 1440

# show x hours at a time
defaults write com.apple.iCal "number of hours displayed" -integer 16

# default event duration
defaults write com.apple.iCal "Default duration in minutes for new event" -integer 60

# default calendar
defaults write com.apple.iCal "CalDefaultCalendar" -string "UseLastSelectedAsDefaultCalendar"

# show birthdays calendar
defaults write com.apple.iCal "display birthdays calendar" -bool true

# show holidays calendar
# TODO
    
# show alternate calendar
# defaults write com.apple.iCal "CALPrefOverlayCalendarIdentifier" -string "chinese"


### alerts

# events
# TODO

# all day events
# TODO

# birthdays
# TODO

# time to leave
# TODO

# show shared calendar messages in notification center
defaults write com.apple.iCal "SharedCalendarNotificationsDisabled" -bool true

# invitations in notifications
defaults write com.apple.iCal "InvitationNotificationsDisabled" -bool false


### advanced

# turn on time zone support
defaults write com.apple.iCal "TimeZone support enabled" -bool false

# show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true

# show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# show invitee declines
defaults write com.apple.iCal InviteeDeclineAlerts -bool true

# open events in new windows
defaults write com.apple.iCal OpenEventsInWindowType -bool false

# warn before sending invitations
defaults write com.apple.iCal WarnBeforeSendingInvitations -bool true