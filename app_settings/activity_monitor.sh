#!/bin/zsh

echo "Activity Monitor settings..."

### view settings

# columns
# TODO

# dock icon (default: show application icon)
# show cpu usage = 5
# show cpu history = 6
# show network usage = 2
# show disk activity = 3
# show application icon = 0
defaults write com.apple.ActivityMonitor IconType -int 0

# update frequency (default: normally)
# very often = 1
# often = 2
# normally = 5
defaults write com.apple.ActivityMonitor UpdatePeriod -int 5

# view (default: my processes)
# all processes = 100
# all processes, hierarchically = 101
# my processes = 102
# system processes = 103
# other user processes = 104
# active processes = 105
# inactive processes = 106
# gpu processes = 110
# windowed processes = 107
# selected processes = ?
# applications in last 12 hours = ?
# processes, by gpu = ?
defaults write com.apple.ActivityMonitor ShowCategory -int 100


### hidden activity monitor tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# show the main window when launching activity monitor
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# sort activity monitor results by cpu usage
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0
