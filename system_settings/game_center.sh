#!/bin/zsh

echo "Game Center settings..."

# TODO
# disabling game center is not possible with sip enabled
# if [[ $(sudo launchctl list | grep com.apple.gamed) == "" ]] &>/dev/null; then
#   :
# else
#   launchctl bootout gui/"$(id -u "$USER")"/com.apple.gamed 2>&1 | grep -v "in progress" | grep -v "No such process"
#   sleep 3
#   launchctl disable gui/"$(id -u "$USER")"/com.apple.gamed
# fi

# profile privacy
# everyone
# friends only
# only you
# TODO

# allow finding by friends
# TODO

# requests from contacts only
# TODO

# nearby players
# TODO

# connect with friends
# TODO