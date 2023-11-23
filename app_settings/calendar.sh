#!/bin/zsh

echo "Calendar settings..."

### general

# default calendar app (default: Calendar)

# days per week (default: 7)
defaults write com.apple.iCal "n days of week" -int 7

# start week on (default: system setting)
# system setting = 0
# sunday = 1
# monday = 2
# ...
# saturday = 7
defaults write com.apple.iCal "first day of week" -int 0

# scroll in week view by (default: week)
# day = 0
# week = 1
# week, stop on today = 2
defaults write com.apple.iCal "scroll by weeks in week view" -integer 1

# day starts at (default: 8:00)
# 06:00 = 360
# 08:00 = 480
# ...
defaults write com.apple.iCal "first minute of work hours" -integer 360

# day ends at (default: 18:00)
# midnight = 1440
defaults write com.apple.iCal "last minute of work hours" -integer 1440

# show x hours at a time (default: 12)
defaults write com.apple.iCal "number of hours displayed" -integer 16

# default event duration (default: 1 hour)
defaults write com.apple.iCal "Default duration in minutes for new event" -integer 60

# default calendar (selected calendar)
defaults write com.apple.iCal "CalDefaultCalendar" -string "UseLastSelectedAsDefaultCalendar"

# show birthdays calendar (default: on)
defaults write com.apple.iCal "display birthdays calendar" -bool true

# show holidays calendar (default: on)
# TODO
    
# show alternate calendar (default: off)
# defaults write com.apple.iCal "CALPrefOverlayCalendarIdentifier" -string "chinese"


### accounts



### alerts

# events (default: none)
# TODO

# all day events (default: none)
# TODO

# use these default alerst on only this computer (default: on)
# TODO

# birthdays (default: none)
# TODO

# time to leave (default: on)
# TODO

# show shared calendar messages in notification center (default: off)
defaults write com.apple.iCal "SharedCalendarNotificationsDisabled" -bool true

# invitations in notifications (default: on)
defaults write com.apple.iCal "InvitationNotificationsDisabled" -bool false


### advanced

# turn on time zone support (default: off)
defaults write com.apple.iCal "TimeZone support enabled" -bool false

# show events in year view (default: off)
defaults write com.apple.iCal "Show heat map in Year View" -bool true

# show week numbers (default: off)
defaults write com.apple.iCal "Show Week Numbers" -bool true

# show invitee declines (default: on)
defaults write com.apple.iCal InviteeDeclineAlerts -bool true

# open events in new windows (default: off)
defaults write com.apple.iCal OpenEventsInWindowType -bool false

# warn before sending invitations (default: on)
defaults write com.apple.iCal WarnBeforeSendingInvitations -bool true