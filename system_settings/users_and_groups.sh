#!/bin/zsh

echo "Users & Groups settings..."

### current user

# change password...
# dscl . -passwd /Users/$USER

# allow this user to administer this computer
# this option has to be selected when creating a user account
# dscl . -merge /Groups/admin GroupMembership "$USER"

# allow user to reset password using apple id
# this is an option you select when activating filevault in preferences gui
# sudo dscl . delete /Users/$USER AuthenticationAuthority ";AppleID;YOUR_APPLE_ID"
# sudo dscl . append /Users/$USER AuthenticationAuthority ";AppleID;YOUR_APPLE_ID"
# check
# dscl . -read /Users/$USER AuthenticationAuthority
# clicking the button in the system settings modifies /var/db/dslocal/nodes/Default/users/$USER.plist
# checking this won't work with command above, it completely removes the button after appending and brings it back with deleting
# sudo plutil -p /var/db/dslocal/nodes/Default/users/$USER.plist
# sudo /usr/libexec/PlistBuddy -c "Print :'LinkedIdentity':'0'" /var/db/dslocal/nodes/Default/users/$USER.plist

# parental control
# can not be enabled for an admin user account
# add a non-admin user account and setup parental control


### guest user

# allow guests to log in to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# limit adult websites
# TODO

# allow guest users to connect to shared folders
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false