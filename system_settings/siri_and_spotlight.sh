#!/bin/zsh

echo "Siri & Spotlight settings..."

# ask siri (default: set in setup assistant)
# if this is set to false some of the following settings will not be set and not be shown correctly in the system settings
defaults write com.apple.assistant.support "Assistant Enabled" -boolean false

# listen for ("hey siri" on headphones) (default: off)
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

# keyboard shortcut (default: off or hold f5)
# off = 0
# hold command space = 2
# hold option space = 3
# press fn space = 4
defaults write com.apple.Siri HotkeyTag -integer 0
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 176 "
  <dict>
    <key>enabled</key>
    <false/>
  </dict>
"

# when setting to another value than off be sure to adjust the values for the keys in ~/Library/Preferences/com.apple.symbolichotkeys.plist
# example: hold command space = 2
# defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 176 "
#  <dict>
#    <key>enabled</key>
#    <true/>
#    <key>value</key>
#    <dict>
#      <key>type</key>
#      <string>modifier</string>
#      <key>parameters</key>
#      <array>
#        <integer>32</integer>
#        <integer>49</integer>
#        <integer>2148532224</integer>
#      </array>
#    </dict>
#  </dict>
# "

# language (default: set in setup assistant)
defaults write com.apple.assistant.backedup "Session Language" -string en-US

# siri voice (default: set in setup assistant)
# options depend on the selected language
# defaults write com.apple.assistant.backedup "Output Voice" -dict \
#   Custom 1 \
#   Footprint 2 \
#   Gender 1 \
#   Language "en-US" \
#   Name "aaron"

# siri suggestions & privacy (default: all enabled)
# to disable "show siri suggestions for x", add the app's bundle identifier to the AppCanShowSiriSuggestionsBlacklist array
defaults delete com.apple.suggestions AppCanShowSiriSuggestionsBlacklist
defaults write com.apple.suggestions AppCanShowSiriSuggestionsBlacklist -array-add \
  "com.apple.AddressBook" \
  "com.apple.FaceTime" \
  "com.apple.iCal" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.podcasts" \
  "com.apple.reminders"

# to disable "learn from this application", add the app's bundle identifier to the SiriCanLearnFromAppBlacklist array
defaults delete com.apple.suggestions SiriCanLearnFromAppBlacklist
defaults write com.apple.suggestions SiriCanLearnFromAppBlacklist -array-add \
  "com.apple.AddressBook" \
  "com.apple.AppStore" \
  "com.apple.clock" \
  "com.apple.FaceTime" \
  "com.apple.freeform" \
  "com.apple.iBooksX" \
  "com.apple.iCal" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.Notes" \
  "com.apple.Photos" \
  "com.apple.podcasts" \
  "com.apple.reminders" \
  "com.apple.Safari" \
  "com.apple.shortcuts" \
  "com.apple.stocks" \
  "com.apple.systempreferences" \
  "com.apple.tips" \
  "net.shinyfrog.bear"

# make changes take effect
defaults read com.apple.suggestions.plist &>/dev/null

# siri responses (default: 3)
# voice feedback
# on = 2
# off = 3
defaults write com.apple.assistant.backedup "Use device speaker for TTS" -int 3

# always show siri captions (default: off)
defaults write com.apple.assistant.backedup "Always Print Siri Response" -bool false

# always show speech (default: off)
defaults write com.apple.assistant.backedup "Always Show Recognized Speech" -bool false


### spotlight

# search results (default: all enabled)
defaults delete com.apple.Spotlight orderedItems

/usr/libexec/PlistBuddy -c 'Add :orderedItems array' ~/Library/Preferences/com.apple.Spotlight.plist

enable_disable_search_result_category () {
  /usr/libexec/PlistBuddy -c 'Add :orderedItems:'$1':enabled bool '$3'' ~/Library/Preferences/com.apple.Spotlight.plist
  /usr/libexec/PlistBuddy -c 'Add :orderedItems:'$1':name string '$2'' ~/Library/Preferences/com.apple.Spotlight.plist
}

spotlightconfig=(
"0      APPLICATIONS                    true"
"1      SYSTEM_PREFS                    true"
"2      DIRECTORIES                     true"
"3      PDF                             true"
"4      FONTS                           false"
"5      DOCUMENTS                       true"
"6      MESSAGES                        true"
"7      CONTACT                         true"
"8      EVENT_TODO                      false"
"9      IMAGES                          false"
"10     BOOKMARKS                       false"
"11     MUSIC                           false"
"12     MOVIES                          false"
"13     PRESENTATIONS                   false"
"14     SPREADSHEETS                    false"
"15     SOURCE                          false"
"16     MENU_DEFINITION                 false"
"17     MENU_OTHER                      false"
"18     MENU_CONVERSION                 false"
"19     MENU_EXPRESSION                 false"
"20     MENU_WEBSEARCH                  false"
"21     MENU_SPOTLIGHT_SUGGESTIONS      false"
)

for entry in "${spotlightconfig[@]}"; do
  ITEMNR=$(echo $entry | awk '{print $1}')
  SPOTLIGHTENTRY=$(echo $entry | awk '{print $2}')
  ENABLED=$(echo $entry | awk '{print $3}')
  enable_disable_search_result_category $ITEMNR $SPOTLIGHTENTRY $ENABLED
done

# makes changes take effect
defaults read com.apple.Spotlight orderedItems &>/dev/null


### hidden siri & spotlight tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# allow siri when locked
defaults write com.apple.Siri LockscreenEnabled -bool false