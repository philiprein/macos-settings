#!/bin/zsh

echo "Wi-Fi settings..."

# key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 6

# delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# adjust keyboard brightness in low light, keyboard brightness, turn keyboard backlight off after inactivity
# cannot be adjusted using a script
# https://apple.stackexchange.com/questions/353038/how-can-i-script-the-keyboard-backlight-settings

# press fn key to
# change input source = 1
# show emoji & symbols = 2
# start dictation (press fn twice) = 3
# do nothing = 0
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# keyboard navigation
# on = 2
# off = 0
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2


### touch bar settings...

if [[ $(pgrep "ControlStrip") != "" ]]; then
  # mac has touch bar
  
  # touch bar shows
  # app controls = app
  # app controls & show control strip = appWithControlStrip
  # expanded control strip = fullControlStrip
  # f1, f2, etc. keys = functionKeys
  # quick actions = workflows
  # quick actions & show control strip = workflowsWithControlStrip
  # spaces = spaces
  # space & show control strip = spacesWithControlStrip
  selected_value="fullControlStrip"
  defaults write com.apple.touchbar.agent PresentationModeGlobal -string $selected_value
  
  # press and hold fn key to
  defaults write com.apple.touchbar.agent PresentationModeFnModes -dict-add $selected_value -string functionKeys

  # show typing suggestions
  defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
else
  # mac doesn't have touch bar
  :
fi


### keyboard shortcuts...

# shortcuts are saved to com.apple.symbolichotkeys.plist AppleSymbolicHotKeys
# to find out which shortcut corresponds to which number
# defaults read com.apple.symbolichotkeys.plist AppleSymbolicHotKeys > ~/Desktop/before.txt
# disable/enable in system settings
# defaults read com.apple.symbolichotkeys.plist AppleSymbolicHotKeys > ~/Desktop/after.txt
# diff ~/Desktop/before.txt ~/Desktop/after.txt
# find the line with enabled = 0/1

# examples
# disable mission control shortcut
# defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 32 "<dict><key>enabled</key><false/></dict>"

# enable application windows on F10
# defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 33 "
#   <dict>
#     <key>enabled</key>
#     <true/>
#     <key>value</key>
#     <dict>
#       <key>parameters</key>
#       <array>
#         <integer>65535</integer>
#         <integer>109</integer>
#         <integer>0</integer>
#       </array>
#       <key>type</key>
#       <string>standard</string>
#     </dict>
#   </dict>
# "

# i like to disable the spotlight shortcut in favor of alfred
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"


### input sources

# add an input source
# example: add a german keyboard as input source
# this overrides some of the values in the KEYBOARD_CONFIG_VALUES arrays in the plists
# i am not sure about the impact this has so use with caution
# TODO

# KEYBOARD_LOCALE="German"
# 3 = QUERTZ
# KEYBOARD_LAYOUT="3"

# system

# KEYBOARD_CONFIG_FILE="/Library/Preferences/com.apple.HIToolbox.plist"
# KEYBOARD_CONFIG_VALUES=(
#   "AppleDefaultAsciiInputSource"
#   "AppleEnabledInputSources"
# )

# for config_value in $KEYBOARD_CONFIG_VALUES; do
#   sudo /usr/libexec/PlistBuddy -c "Delete :"$config_value"" "$KEYBOARD_CONFIG_FILE" 2>/dev/null
#   sudo /usr/libexec/PlistBuddy -c "Add :"$config_value" array" "$KEYBOARD_CONFIG_FILE"
#   sudo /usr/libexec/PlistBuddy -c "Add :"$config_value":0 dict" "$KEYBOARD_CONFIG_FILE"
#   sudo /usr/libexec/PlistBuddy -c "Add :"$config_value":0:InputSourceKind string 'Keyboard Layout'" "$KEYBOARD_CONFIG_FILE"
#   sudo /usr/libexec/PlistBuddy -c "Add :"$config_value":0:'KeyboardLayout ID' integer "$KEYBOARD_LAYOUT"" "$KEYBOARD_CONFIG_FILE"
#   sudo /usr/libexec/PlistBuddy -c "Add :"$config_value":0:'KeyboardLayout Name' string '"$KEYBOARD_LOCALE"'" "$KEYBOARD_CONFIG_FILE"
# done

# user

# KEYBOARD_CONFIG_FILE="/Users/$USER/Library/Preferences/com.apple.HIToolbox.plist"
# KEYBOARD_CONFIG_VALUES=(
#   "AppleEnabledInputSources" 
#   "AppleSelectedInputSources"
# )

# /usr/libexec/PlistBuddy -c "Delete :AppleCurrentKeyboardLayoutInputSourceID" "$KEYBOARD_CONFIG_FILE" 2> /dev/null
# /usr/libexec/PlistBuddy -c "Add :AppleCurrentKeyboardLayoutInputSourceID string com.apple.keylayout."$KEYBOARD_LOCALE"" "$KEYBOARD_CONFIG_FILE"
# for config_value in $KEYBOARD_CONFIG_VALUES; do
#   if [[ -z $(/usr/libexec/PlistBuddy -c "Print :"$config_value"" "$KEYBOARD_CONFIG_FILE") ]]; then
#   /usr/libexec/PlistBuddy -c "Delete :"$config_value"" "$KEYBOARD_CONFIG_FILE" 2>/dev/null
#   /usr/libexec/PlistBuddy -c "Add :"$config_value" array" "$KEYBOARD_CONFIG_FILE"
#   /usr/libexec/PlistBuddy -c "Add :"$config_value":0 dict" "$KEYBOARD_CONFIG_FILE"
#   /usr/libexec/PlistBuddy -c "Add :"$config_value":0:InputSourceKind string 'Keyboard Layout'" "$KEYBOARD_CONFIG_FILE"
#   /usr/libexec/PlistBuddy -c "Add :"$config_value":0:'KeyboardLayout ID' integer "$KEYBOARD_LAYOUT"" "$KEYBOARD_CONFIG_FILE"
#   /usr/libexec/PlistBuddy -c "Add :"$config_value":0:'KeyboardLayout Name' string '"$KEYBOARD_LOCALE"'" "$KEYBOARD_CONFIG_FILE"
# done

# show input menu in menu bar
defaults write com.apple.TextInputMenu visible -bool false

# correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# spelling
# automatic by language
defaults write NSGlobalDomain NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true
defaults delete NSGlobalDomain "KB_SpellingLanguage"
defaults write NSGlobalDomain "KB_SpellingLanguage" -dict-add "KB_SpellingLanguageIsAutomatic" 1
# language
# TODO
# changes several different values depending on selected language

# use smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# for double quotes
# TODO
# changes several different values depending on selected quotes

# for single quotes
# TODO
# changes several different values depending on selected quotes


### dictation

# use dictation
defaults write com.apple.assistant.support "Dictation Enabled" -bool false
defaults write com.apple.HIToolbox AppleDictationAutoEnable -bool false

# language
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs VisibleNetworkSRLocaleIdentifiers -dict-add "de_DE" 1 "en_GB" 1
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMNetworkBasedLocaleIdentifier -string "de_DE"

# microphone source
# values depend on available sources

# shortcut
# disable
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 164 "
  <dict>
    <key>enabled</key>
    <false/>
    <key>value</key>
    <dict>
      <key>parameters</key>
      <array>
        <integer>65535</integer>
        <integer>65535</integer>
        <integer>0</integer>
      </array>
      <key>type</key>
      <string>standard</string>
    </dict>
  </dict>
"

# auto-punctuation
defaults write com.apple.assistant.support "Dictation Auto Punctuation Enabled" -bool true

 ### hidden keyboard tweaks
    
# enable/disable press-and-hold for keys (benefits key repeat)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true

# use all F1, F2, etc. keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false