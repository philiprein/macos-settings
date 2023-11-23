#!/bin/zsh

# this is a list of hidden settings that i found online but couldn't associate with any of the system settings

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# Disable focus ring (glowing outline around buttons and fields when you tab through user interface) animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Adjust toolbar title rollover delay
# defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true

# expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not to icloud) by default
# false = save to disk, true = save to icloud
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable the "are you sure you want to open this application?" dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# increase window resize speed for cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# remove duplicates in the open with menu (also see `lscleanup` alias)
# echo removing duplicate entries in open with menu, this can take a while...
# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user

# display ascii control characters using caret notation in standard text views
# try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
# defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# disable transparency in the menu bar and elsewhere
# defaults write com.apple.universalaccess reduceTransparency -bool true

# disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# disable the crash reporter
# on = "none"
# off = "crashreport"
# defaults write com.apple.CrashReporter DialogType -string "none"

# set help viewer windows to non-floating mode
# defaults write com.apple.helpviewer DevMode -bool true

# reveal ip address, hostname, os version, etc. when clicking the clock in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# use encrypted virtual memory
# defaults write com.apple.virtualMemory UseEncryptedSwap -bool YES

# disable press-and-hold for keys in favor of key repeat (repeat a character instead of showing accent options)
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# stop apple music from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null
# undo
# launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true