#!/bin/zsh

echo "Contacts settings..."

echo "Opening and quitting contacts in background..."

# without opening contacs first some settings could not be applied (e.g. ABDefaultAddressCountryCode)
osascript <<EOF
  try
    tell application "Contacts"
      run
      delay 3
      quit
    end tell
  end try		
EOF

### general

# show first name
# before last name = 1
# after last name = 2
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -integer 1

# sort by
# first name = "sortingFirstName sortingLastName"
# last name = "sortingLastName sortingFirstName"
defaults write com.apple.addressbook ABNameSortingFormat -string "sortingFirstName sortingLastName"

# short name format
# full name = 0
# first name & last initial = 1
# first initial & last name = 2
# first name only = 3
# last name only = 4
defaults write NSGlobalDomain NSPersonNameDefaultShortNameFormat -integer 2

# prefer nicknames
defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -integer 1

# show siri suggestions
# disabled in system settings: siri_and_spotlight.sh

# address format
defaults write com.apple.addressbook ABDefaultAddressCountryCode -string "de"


### accounts


### template


### vcard

# vcard format
# 3.0 = false
# 2.1 = true
defaults write com.apple.addressbook ABUsevCard21Format -bool false

# vcard 2.1 encoding
# defaults write com.apple.addressbook AB21vCardEncoding -bool "utf-8"

# enable private me card
defaults write com.apple.addressbook ABPrivateVCardFieldsEnabled -bool true

# export notes in vcards
defaults write com.apple.addressbook ABIncludeNotesInVCard -bool true

# export photos in vcards
defaults write com.apple.addressbook ABIncludePhotosInVCard -bool true


### hidden contacts tweaks

# enable the debug menu
defaults write com.apple.addressbook ABShowDebugMenu -bool false

# show contacts found in mail
defaults write com.apple.suggestions SuggestionsShowContactsFoundInMail -bool false