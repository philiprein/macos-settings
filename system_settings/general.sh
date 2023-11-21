#!/bin/zsh

echo "General settings..."

### about



### software update

# to enable "Automatic updates" set all options below to true

# check for updates automatically
sudo softwareupdate --schedule on
# or
#sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# download new updates in the background when available
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# install macos updates automatically
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool false

# install application updates from the App Store automatically
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# install system and security updates automatically
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true


### storage



### airdrop and handoff

# allow handoff between this mac and your icloud devices
# false = off, true = on
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

# set airdrop discoverable mode 
# Off 
# Contacts Only
# Everyone
defaults write com.apple.sharingd DiscoverableMode -string "Contacts Only"


### login items

# open at login

# apps generate the open at login entry automatically when they are first launched

# allow in the background

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

# setup assistant language (system and login screen)
# default: en
#sudo languagesetup -langspec en

# preferred languages
defaults write NSGlobalDomain AppleLanguages -array "en-DE" "de-DE"
defaults write NSGlobalDomain AppleLocale -string "en_DE@currency=EUR"

# calendar & first day of week
# 2 = monday, 3 = tuesday, ...
defaults write NSGlobalDomain AppleFirstWeekday -array "gregorian = 2"

# temperature
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# measurement system
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# list sort order (default: universal)
defaults write NSGlobalDomain AppleCollationOrder -string "de@collation=universal"
# or
#defaults delete NSGlobalDomain AppleCollationOrder

# live text
defaults write NSGlobalDomain AppleLiveTextEnabled -bool true


### date & time

# set date and time automatically
sudo systemsetup -setusingnetworktime on

# source

# get default
# sudo systemsetup -getnetworktimeserver

# use default by not setting anything else
# redirecting output due to this error message
# Error:-99 File:/AppleInternal/Library/BuildRoots/0783246a-4091-11ee-8fca-aead88ae2785/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379
# sudo systemsetup -setnetworktimeserver time.apple.com 2>/dev/null 1>&2

# 12 hour clock
# 12h clock off = 24h clock on
# be sure the system settings window is not open when using this or it won`t work
# defaults write NSGlobalDomain AppleICUForce12HourTime -bool false
# will be set to AppleICUForce24HourTime later
# defaults delete NSGlobalDomain AppleICUForce12HourTime

# set time zone automatically using current location
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# set the timezone; see "systemsetup -listtimezones" for other values
# redirecting output due to this error message
# Error:-99 File:/AppleInternal/Library/BuildRoots/0783246a-4091-11ee-8fca-aead88ae2785/Library/Caches/com.apple.xbs/Sources/Admin/InternetServices.m Line:379
sudo systemsetup -settimezone "Europe/Berlin" 2>/dev/null 1>&2


### sharing

# screen sharing

# allow to ask for permission to share screen
# sudo defaults write /Library/Preferences/com.apple.RemoteManagement.plist ScreenSharingReqPermEnabled -bool true

# file sharing

# deactivate smb file server
# if [[ $(sudo launchctl list | grep com.apple.smbd) == "" ]] &>/dev/null; then
#   : 
# else
#   sudo launchctl bootout system "/System/Library/LaunchDaemons/com.apple.smbd.plist" 2>&1 | grep -v "in progress" | grep -v "No such process"
#   sleep 2
#   sudo launchctl disable system/com.apple.smbd
# fi

# deactivate afp file server
# if [[ $(sudo launchctl list | grep com.apple.AppleFileServer) == "" ]] &>/dev/null; then
#     :
# else
#   sudo launchctl bootout system "/System/Library/LaunchDaemons/com.apple.AppleFileServer.plist" 2>&1 | grep -v "in progress" | grep -v "No such process"
#   sleep 2
#   sudo launchctl disable system/com.apple.AppleFileServer
# fi

# turn off internet sharing
# if [[ $(sudo launchctl list | grep com.apple.InternetSharing) == "" ]] &>/dev/null; then
#   :
# else
#   sudo launchctl bootout system "/System/Library/LaunchDaemons/com.apple.InternetSharing.plist" 2>&1 | grep -v "in progress" | grep -v "No such process"
#   sleep 2
#   sudo launchctl disable system/com.apple.InternetSharing
# fi

# printer sharing

# cupsctl --share-printers
# cupsctl --no-share-printers
# sets preferences in 
# /etc/cups/cupsd.conf
# /etc/cups/printers.conf
# check
# system_profiler SPPrintersDataType | grep "Printer Sharing"
# system_profiler SPPrintersDataType | grep Shared

# remote login

# sudo systemsetup -setremotelogin on
# sudo systemsetup -setremotelogin off
# check
# sudo systemsetup -getremotelogin

# remote management

# screen sharing has to be enabled additionally for this to work
# sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate
# sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop

# remote apple events

# sudo systemsetup -setremoteappleevents on
# sudo systemsetup -setremoteappleevents off
# check
# sudo systemsetup -getremoteappleevents | grep "Apple Events"

# internet sharing

# disable
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.nat NAT -dict Enabled -int 0
# check
# sudo defaults read /Library/Preferences/SystemConfiguration/com.apple.nat | grep -i Enabled

# content caching

# sudo AssetCacheManagerUtil activate
# sudo AssetCacheManagerUtil deactivate

# media sharing (needs reboot)

# defaults write com.apple.amp.mediasharingd public-sharing-enabled -bool false
# defaults write com.apple.amp.mediasharingd home-sharing-enabled -bool false

# bluetooth sharing

# needs logout / reboot
# defaults -currentHost write com.apple.bluetooth PrefKeyServicesEnabled -bool true
# defaults -currentHost write com.apple.bluetooth PrefKeyServicesEnabled -bool false
    
# airplay receiver

# enable/disable
# defaults -currentHost write com.apple.controlcenter AirplayRecieverEnabled -bool true
# defaults -currentHost write com.apple.controlcenter AirplayRecieverEnabled -bool false
# if enabled
# 1 = allow from same icloud user
# 2 = allow from complete same network
# 3 = allow from everyone
# defaults -currentHost write com.apple.controlcenter AirplayReceiverAdvertising -int 1



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
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$MY_HOSTNAME"
dscacheutil -flushcache
unset MY_HOSTNAME


### time machine

# disable time machine
sudo defaults write /Library/Preferences/com.apple.TimeMachine MobileBackups -bool false
sudo defaults write /Library/Preferences/com.apple.TimeMachine AutoBackup -bool false

# run time machine backups on battery power
sudo defaults write /Library/Preferences/com.apple.TimeMachine RequiresACPower -bool true

# exclude system files
sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipSystemFiles -bool true

# show warning after deleting old backups
sudo defaults write /Library/Preferences/com.apple.TimeMachine AlwaysShowDeletedBackupsWarning -bool true
    
# prevent time machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

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


