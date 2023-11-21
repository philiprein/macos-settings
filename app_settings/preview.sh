#!/bin/zsh

echo "Preview settings..."

### general

# window background
# TODO

### images

# when opening files
# open all files in one window = 0
# open groups of files in the same window = 1
# open each file in its own window = 2
defaults write com.apple.Preview PVImageOpeningMode -int 0

# define 100% scale as
# 1 image pixel equals 1 screen point = 0
# size on screen equals size on printout = 2
defaults write com.apple.Preview PVImageRespectDPIForScaleMode -int 0


### pdf

# define 100% scale as
# 1 image pixel equals 1 screen point = 0
# size on screen equals size on printout = 1
defaults write com.apple.Preview PVPDFRespectScreenDPIForScale -int 2

# on opening documents start on the last viewed page
defaults write com.apple.Preview kPVPDFRememberPageOption -bool true

# opening for the first time show as
# continuous scroll = 0
# single page = 1
# two pages = 2
defaults write com.apple.Preview kPVPDFDefaultPageViewModeOption -int 0

# viewing documents: use logical page numbers (e.g. "iv")
defaults write com.apple.Preview kPVPDFLogicalPagesOption -bool true

# annotations: add name to annotations
# defaults write com.apple.Preview PVGeneralUseUserName -bool true
# name:
# defaults write com.apple.Preview PVGeneralUserName -string ""