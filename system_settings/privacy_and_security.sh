#!/bin/zsh

echo "Privacy & Security settings..."

### privacy
# TODO
# it seems that most of the settings here can only be changed by writing to read-only databases
# making these databases writable would require disabling system integrity protection (SIP)


# DATABASE_SYSTEM="/Library/Application Support/com.apple.TCC/TCC.db"
# DATABASE_USER="/Users/"$USER"/Library/Application Support/com.apple.TCC/TCC.db"

# remove application from accessibility
# sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "delete from access where client='IDENTIFIER';"

# clearing complete access table
# sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "DELETE FROM access"

# permission on for all apps listed
# sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'UPDATE access SET allowed = "1";'

# permission off for all apps listed
# sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'UPDATE access SET allowed = "0";'

# getting entries from database
# sudo sqlite3 "$DATABASE_SYSTEM" "select * from access where service='kTCCServiceAccessibility';"

# delete database entries for input service
# sudo sqlite3 "$DATABASE_SYSTEM" "DELETE FROM access WHERE service='kTCCServiceAccessibility';"

# set_app_security_permission() {
#   local APP_ID=$1
#   local INPUT_SERVICE=$2
#   local PERMISSION_GRANTED=$3

#   if [[ "$INPUT_SERVICE" == "kTCCServiceAccessibility" ]] || 
#     [[ "$INPUT_SERVICE" == "kTCCServiceScreenCapture" ]] || 
#     [[ "$INPUT_SERVICE" == "kTCCServiceSystemPolicyAllFiles" ]] || 
#     [[ "$INPUT_SERVICE" == "kTCCServiceDeveloperTool" ]] || 
#     [[ "$INPUT_SERVICE" == "kTCCServicePostEvent" ]]; then

#     if [[ $PERMISSION_GRANTED == "0" ]]
#     then
#       :
#     elif [[ $PERMISSION_GRANTED == "1" ]]
#     then
#       PERMISSION_GRANTED=2
#     else
#       echo "PERMISSION_GRANTED can either be 0 or 1, exiting..."
#       exit
#     fi

#     # delete entry before resetting
#     sudo sqlite3 "$DATABASE_SYSTEM" "delete from access where (service='$INPUT_SERVICE' and client='$APP_ID');" 2>&1 | grep -v '^$'
#     sudo sqlite3 "$DATABASE_SYSTEM" "delete from access where (service='kTCCServicePostEvent' and client='$APP_ID');" 2>&1 | grep -v '^$'
#     sleep 0.1
#     if [[ "$MACOS_VERSION_MAJOR" != "13" ]]; then
#       sudo sqlite3 "$DATABASE_SYSTEM" "REPLACE INTO access VALUES('$INPUT_SERVICE','$APP_ID',0,$PERMISSION_GRANTED,4,1,NULL,NULL,NULL,?,NULL,0,?);" 2>&1 | grep -v '^$'
#     elif [[ "$MACOS_VERSION_MAJOR" != "14" ]]; then
#       sudo sqlite3 "$DATABASE_SYSTEM" "REPLACE INTO access VALUES('$INPUT_SERVICE','$APP_ID',0,$PERMISSION_GRANTED,4,1,?,NULL,0,'UNUSED',NULL,0,?,NULL,NULL,'UNUSED',?);"
#     else
#       :
#     fi
#   else
#     # delete entry before resetting
#     sqlite3 "$DATABASE_USER" "delete from access where (service='$INPUT_SERVICE' and client='$APP_ID');" 2>&1 | grep -v '^$'
#     sleep 0.1
#     if [[ "$MACOS_VERSION_MAJOR" != "13" ]]; then
#       sqlite3 "$DATABASE_USER" "REPLACE INTO access VALUES('$INPUT_SERVICE','$APP_ID',0,$PERMISSION_GRANTED,4,1,?,NULL,NULL,?,NULL,NULL,?);" 2>&1 | grep -v '^$'
#     elif [[ "$MACOS_VERSION_MAJOR" != "14" ]]; then
#       sqlite3 "$DATABASE_USER" "REPLACE INTO access VALUES('$INPUT_SERVICE','$APP_ID',0,$PERMISSION_GRANTED,4,1,?,NULL,0,'UNUSED',NULL,0,?,NULL,NULL,'UNUSED',?);" 2>&1 | grep -v '^$'
#     else
#       :
#     fi
#   fi
# }

# set_app_security_permission "com.apple.Terminal" "kTCCServiceAccessibility" "1"

### analytics & improvements

# share mac analytics
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" AutoSubmit -bool false
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" SeedAutoSubmit -bool false
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" AutoSubmitVersion -integer 4

# improve siri & dictation
defaults write com.apple.assistant.support "Siri Data Sharing Opt-In Status" -integer 2

# share with app developers
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" ThirdPartyDataSubmit -bool false
defaults write "/Library/Application Support/CrashReporter/DiagnosticMessagesHistory.plist" ThirdPartyDataSubmitVersion -integer 4

# share icloud analytics
# only has to be done once for your apple account on appleid.apple.com to stay off
# privacy -> settings for data privacy -> disable share icloud analytics data


### apple advertising

# personalized ads
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false


### security

# allow applications downloaded from

# app store
# sudo spctl --master-enable
# sudo spctl --disable

# app store and identified developers
sudo spctl --master-enable
sudo spctl --enable

# disable gatekeeper completely
# sudo spctl --master-disable

# use gatekeeper whitelist
# sudo spctl --add --label "GitHub" "$PATH_TO_APPS"/GitHub.app
# spctl --enable --label "GitHub"
# spctl --disable --label "GitHub"

# filevault
# TODO
if [[ $(fdesetup isactive) == "true" ]]; then
  # filevault is already enabled
  # echo "FileVault is enabled."
else
  # filevault is disabled
  # echo "FileVault is disabled. Enable in System Settings -> Privacy & Security"
fi

# enabling filevault via script leads to complications with other settings
# usually filevault is enabled/disabled in setup assistant anyway

# lockdown mode
# TODO
# it usually does not make sense to enable this (see the settings description)


### extensions
# TODO
# these are incomplete

# finder
defaults write pbs FinderActive -dict-add APPEXTENSION-com.apple.finder.CreatePDFQuickAction -bool true
defaults write pbs FinderActive -dict-add APPEXTENSION-com.apple.finder.MarkupQuickAction -bool true
defaults write pbs FinderActive -dict-add APPEXTENSION-com.apple.finder.RotateQuickAction -bool true
defaults write pbs FinderActive -dict-add APPEXTENSION-com.apple.finder.TrimQuickAction -bool true


### profiles



### advanced...

# require an administrator password to access system-wide settings
# TODO: Test this

# list of system preference panes
# defaults read /System/Library/Security/authorization.plist | grep system.preferences

# setting all system preference panes to need a password that have the option available
# SYSTEM_PREFERENCES_LIST=("${(@f)$(defaults read /System/Library/Security/authorization.plist | grep system.preferences | grep -o '".*"' | sed 's/"//g')}")
# for i in $SYSTEM_PREFERENCES_LIST; do
#   if [[ $(security authorizationdb read "$i" 2>&1 | grep "shared" | grep -v "YES \(0\)") != "" ]]; then
#     # option available
#     (sudo security authorizationdb read "$i" > /tmp/"$i".plist) 2>&1 | grep -v "YES (0)"
#     sleep 0.5
#     (sudo /usr/libexec/PlistBuddy -c "Set :shared false" /tmp/"$i".plist) 2>&1 | grep -v "YES (0)"
#     sleep 0.5
#     (sudo security authorizationdb write "$i" < /tmp/"$i".plist) 2>&1 | grep -v "YES (0)"  
#   else
#     # option not available
#     :
#   fi
# done

# log out automatically after inactivity
# disable
sudo defaults delete /Library/Preferences/.GlobalPreferences.plist com.apple.autologout.AutoLogOutDelay
# enable 
# value = time in seconds
# sudo defaults write /Library/Preferences/.GlobalPreferences.plist com.apple.autologout.AutoLogOutDelay -int 3600