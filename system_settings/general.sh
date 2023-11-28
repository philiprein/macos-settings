#!/bin/zsh

echo "General settings..."

### about

### software update

# to enable "Automatic updates" set all options below to true

# check for updates (default: on)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# download new updates when available (default: on)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# install macos updates automatically (default: off)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

# install application updates from the App Store automatically (default: off)
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# install system and security updates automatically (default: on)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

### storage

# store in icloud (default: set in setup assistant)
# TODO

# optimize storage (default: off)
defaults write com.apple.TV automaticallyDeleteVideoAssetsAfterWatching -bool false

# empty bin automatically (default: off)
defaults write com.apple.finder FXRemoveOldTrashItems -bool false

### airdrop & handoff

# allow handoff between this mac and your icloud devices (default: on)
# on = true, true
# off = false, false
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

# airdrop (default: "Off")
# no one = "Off"
# contacts only = "Contacts Only"
# everyone = "Everyone"
defaults write com.apple.sharingd DiscoverableMode -string "Contacts Only"

# airplay receiver (default: on)
defaults write -currentHost com.apple.controlcenter AirplayRecieverEnabled -bool true

# allow airplay for (default: 1)
# current user = 1
# anyone on the same network = 2
# everyone = 3
defaults write -currentHost com.apple.controlcenter AirplayReceiverAdvertising -int 1

# require password
# TODO

### login items

# open at login
# TODO
# apps generate the open at login entry automatically when they are first launched

# allow in the background
# TODO
# it seems an entry in the BackgroundItems file is needed
# readable output
# sfltool dumpbtm /private/var/db/com.apple.backgroundtaskmanagement/BackgroundItems-v8.btm
# delete all data from login-items
# sfltool resetbtm

# disabling
# bootout, disbale and remove with launchctl did not work as of 2023-09

# deleting and disabling
# to make an item disappear from the list, delete the corresponding files in
# /Library/LaunchAgents			system
# /Library/LaunchDaemons		system
# ~/Library/LaunchAgents		user
# will be reinstalled on every app update of the corresponding app

### language & region

# preferred languages & region (default: set in setup assistant)
defaults write NSGlobalDomain AppleLanguages -array "en-DE" "de-DE"
defaults write NSGlobalDomain AppleLocale -string "en_DE@currency=EUR"

# calendar & first day of week  (default: set in setup assistant)
# sunday = 1
# monday = 2
# ...
# saturday = 6
defaults write NSGlobalDomain AppleFirstWeekday -array "gregorian = 2"

# temperature  (default: set in setup assistant)
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# measurement system  (default: set in setup assistant)
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# list sort order (default: set in setup assistant)
defaults write NSGlobalDomain AppleCollationOrder -string "de@collation=universal"

# term of address
# "", masculine, feminine, neuter
defaults write com.apple.morphology.internal AppleUserMorphology -dict-add grammaticalGender masculine

# share with all applications
defaults write com.apple.morphology.internal AppleUserMorphologyAllowThirdPartyAccess -bool false

# live text (default: on)
defaults write NSGlobalDomain AppleLiveTextEnabled -bool true

# translation languages...
# TODO

### date & time

# set date and time automatically (default: on)
sudo systemsetup -setusingnetworktime on

# source (default: sudo systemsetup -getnetworktimeserver)
sudo systemsetup -setnetworktimeserver time.apple.com &>/dev/null

# 12-hour time (default: set in setup assistant)
# be sure the system settings window is not open when using this or it won`t work
# 12-hour time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool true
# 24-hour time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool false

# set time zone automatically using your current location (default: on)
# TODO
# seems to not work anymore...
# sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# closest city
# see "systemsetup -listtimezones" for other values
sudo systemsetup -settimezone "Europe/Berlin" &>/dev/null

### sharing

# enabling seems to require entries in write protected kTCC database
# enable_sharing_service() {
#   if [[ $(sudo launchctl list | grep "$1") == "" ]] &>/dev/null; then
#     sudo launchctl enable system/"$1"
#     sleep 2
#     sudo launchctl bootstrap system "/System/Library/LaunchDaemons/"$1".plist" 2>&1 | grep -v "in progress" | grep -v "already bootstrapped"
#   else
#     :
#   fi
# }

# disable_sharing_service() {
#   if [[ $(sudo launchctl list | grep "$1") == "" ]] &>/dev/null; then
#     :
#   else
#     sudo launchctl bootout system "/System/Library/LaunchDaemons/"$1".plist" 2>&1 | grep -v "in progress" | grep -v "No such process"
#     sleep 2
#     sudo launchctl disable system/"$1"
#   fi
# }

# file sharing (default: off)
# TODO
# deactivate smb file server
# disable_sharing_service "com.apple.smbd"
# deactivate afp file server
# disable_sharing_service "com.apple.AppleFileServer"

# media sharing (default: off) (needs reboot)
defaults write com.apple.amp.mediasharingd public-sharing-enabled -bool false
defaults write com.apple.amp.mediasharingd home-sharing-enabled -bool false

# screen sharing (default: off)
# TODO
# disable_sharing_service "com.apple.screensharing"

# allow access for
# TODO

# anyone may request permission to control screen
sudo defaults write /Library/Preferences/com.apple.RemoteManagement.plist ScreenSharingReqPermEnabled -bool true

# VNC viewers may control screen with password
# TODO

# content caching (default: off)
# on = activate
# off = deactivate
sudo AssetCacheManagerUtil deactivate

# bluetooth sharing (default: off) (needs logout)
defaults -currentHost write com.apple.bluetooth PrefKeyServicesEnabled -bool false

# printer sharing (default: off)
# on = --share-printers
# off = --no-share-printers
cupsctl --no-share-printers
# sets preferences in
# /etc/cups/cupsd.conf
# /etc/cups/printers.conf
# check
# system_profiler SPPrintersDataType | grep "Printer Sharing"
# system_profiler SPPrintersDataType | grep Shared

# internet sharing (default: off)
# TODO
# disable_sharing_service "com.apple.InternetSharing"
# disable
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.nat NAT -dict Enabled -int 0
# check
# sudo defaults read /Library/Preferences/SystemConfiguration/com.apple.nat | grep -i Enabled

# remote management (default: off)
# TODO

# remote login (default: off)
# on = on
# off = off
sudo systemsetup -setremotelogin off
# check
# sudo systemsetup -getremotelogin

# remote application scripting
# TODO

# local hostname
MY_HOSTNAME=$(system_profiler SPHardwareDataType |
  grep "Model Name" |
  awk -F":" '{print $2}' |
  tr '[:upper:]' '[:lower:]' |
  sed 's/^[[:space:]]*//g' |
  sed -e 's/[[:space:]]*$//g' |
  sed -e 's/ //g' |
  sed 's/^/'"$USER"'s-/g')

sudo scutil --set ComputerName "$MY_HOSTNAME"
sudo scutil --set LocalHostName "$MY_HOSTNAME"
sudo scutil --set HostName "$MY_HOSTNAME"
# not needed, gets set automatically
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MY_HOSTNAME"
dscacheutil -flushcache
unset MY_HOSTNAME

# use dynamic global hostname
# TODO

### time machine

# back up frequency (default: 3600)
# manually
# sudo defaults delete /Library/Preferences/com.apple.TimeMachine AutoBackupInterval
# automatically every hour = 3600
# automatically every day = 86400
# automatically every week = 604800
sudo defaults write /Library/Preferences/com.apple.TimeMachine AutoBackupInterval -int 3600

# back up on battery power (default: on)
sudo defaults write /Library/Preferences/com.apple.TimeMachine RequiresACPower -bool true

### hidden time machine tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# disable/enable time machine
sudo defaults write /Library/Preferences/com.apple.TimeMachine MobileBackups -bool true
sudo defaults write /Library/Preferences/com.apple.TimeMachine AutoBackup -bool true

# exclude system files
# sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipSystemFiles -bool true

# show warning after deleting old backups
# sudo defaults write /Library/Preferences/com.apple.TimeMachine AlwaysShowDeletedBackupsWarning -bool true

# prevent time machine from prompting to use new hard drives as backup volume
# sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# disable local time machine backups / snapshots
# sudo tmutil disable

# delete possible snapshots
# list localsnapshots
# tmutil listlocalsnapshots / | cut -d'.' -f4-
# tmutil listlocalsnapshots / | rev | cut -d'.' -f1 | rev
# tmutil listlocalsnapshotdates | grep -v '[a-zA-Z]'

# if [[ $(tmutil listlocalsnapshotdates | grep -v '[a-zA-Z]') == "" ]]
# then
#   # no local time machine backups found
#   :
# else
#   echo "local time machine backups found, deleting..."
#   for i in $(tmutil listlocalsnapshotdates | grep -v '[a-zA-Z]')
#   do
#     tmutil deletelocalsnapshots "$i"
#   done
# fi

### transfer or reset

### startup disk

### hidden general tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# setup assistant language (system and login screen)
# sudo languagesetup -langspec en

# remote apple events (default: off)
# on = on
# off = off
sudo systemsetup -setremoteappleevents off
# check
# sudo systemsetup -getremoteappleevents | grep "Apple Events"
