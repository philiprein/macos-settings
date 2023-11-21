#!/bin/zsh

echo "Finder settings..."

### general

# show these items on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# new finder windows show
# computer = PfCm
# volume = PfVo, "file:///"
# home folder = PfHm, "file://${HOME}/"
# desktop = PfDe, "file://${HOME}/Desktop/"
# documents = PfDo, "file://${HOME}/Documents/"
# icloud drive = PfID, "file://${HOME}/Library/Mobile%20Documents/com~apple~CloudDocs/"
# recents = PfAF, "file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch/"
# Other… = PfLo, "file:///full/path/here/"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# open folders in tabs instead of new windows
defaults write com.apple.finder FinderSpawnTab -bool false

### tags



### sidebar

# settings are in 
# ~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.FavoriteVolumes.sfl2
# and
# ~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.FavoriteItems.sfl2
# and
# $HOME/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.FavoriteServers.sfl2

# finder sidebar settings are not easily scriptable because they are not stored in com.apple.finder.plist
# there is a tool called 'mysides' (https://github.com/mosen/mysides), but it only works on intel macs
# there is also a python script called 'FinderSidebarEditor' (https://github.com/robperc/FinderSidebarEditor), but this would require a python interpreter installed
# another solution is a gui script like this one: https://medium.com/@laclementine/favoris-vidéos-musique-images-dans-la-barre-latérale-du-finder-1652d8143961
# i don't like either of these solutions, so i'll leave this to be done manually for now

# TODO

# tags
defaults write com.apple.finder ShowRecentTags -bool false


### advanced

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# show warning before removing from icloud drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# show warning before emptying the trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# remove items from the trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool false

# keep folders on top in windows when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# keep folders on top on desktop
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# when performing a search:
# search this mac = SCev
# search the current folder = SCcf
# use the previous search scope = SCsp
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


### view settings (cmd + j)

# default finder view style
# as icons = icnv
# as list = Nlsv
# as columns = clmv
# as gallery = Flwv
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# default finder grouping
defaults write com.apple.finder FXPreferredGroupBy -string "None"


# icon view

# sort by
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# finder icon view
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# icon size
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# finder icon view
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# grid spacing
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 62" ~/Library/Preferences/com.apple.finder.plist
# finder icon view
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 62" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 62" ~/Library/Preferences/com.apple.finder.plist

# text size
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist
# finder icon view
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist

# label position
# bottom = true
# right = false
# desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist
# finder icon view 
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:labelOnBottom true" ~/Library/Preferences/com.apple.finder.plist

# show item info
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
# finder icon view 
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo false" ~/Library/Preferences/com.apple.finder.plist

# show item info
# desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist
# finder icon view 
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showIconPreview true" ~/Library/Preferences/com.apple.finder.plist

# background
# default = 0
# color = 1
# picture = 2
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:backgroundType 0" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:backgroundType 0" ~/Library/Preferences/com.apple.finder.plist


# list view
# TODO


# column view
# TODO


# gallery view
# TODO

### view settings

# show/hide side bar
defaults write com.apple.finder ShowSidebar -bool true

# show/hide preview
defaults write com.apple.finder ShowPreviewPane -bool false

# show/hide toolbar
defaults write com.apple.finder "TB Is Shown" -bool true

# show/hide tab bar
defaults write com.apple.finder ShowTabView -bool false

# show/hide path bar
defaults write com.apple.finder ShowPathbar -bool true

# show/hide status bar
defaults write com.apple.finder ShowStatusBar -bool false


### hidden finder tweaks

# settings that are commented out couldn't be validated to see if they were out of date or not

# empty trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool false

# allow quitting via cmd + q
# doing so will also hide files and folders on the desktop
defaults write com.apple.finder QuitMenuItem -bool false

# disable window animations and get info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool false

# allow text selection in quick look
defaults write com.apple.finder QLEnableTextSelection -bool true

# display full posix path as finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# avoid creating .DS_Store files on removable drives
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# disable disk image verification
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# automatically open a new finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# expand file info panes (cmd + i)
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

# show ~/Libary folder

# show extended attributes
# ls -la@e ~/
# xattr ~/Library
# xattr -p com.apple.FinderInfo ~/Library
# xattr -l ~/Library

# show extended attributes to copy / paste for restore with xattr -wx
# xattr -px com.apple.FinderInfo ~/Library

# delete all extended attributes
# xattr -c ~/Library

# delete specific extended attribute
if [[ ! $(xattr -p com.apple.FinderInfo ~/Library) ]]; then
    :
else
    xattr -d com.apple.FinderInfo ~/Library
fi
# set folder flag to not hidden
chflags nohidden ~/Library

# undo show the ~/Library folder
# set extended attribute
# xattr -wx com.apple.FinderInfo "00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00" ~/Library
# chflags hidden ~/Library