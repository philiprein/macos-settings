#!/bin/zsh

echo "Screenshot settings..."

# save to (default: Desktop)
# desktop = file, "${HOME}/Desktop"
# documents = file, "${HOME}/Documents"
# clipboard = clipboard
# mail = mail
# messages = messages
# preview = preview
# other location... = file, path (e.g. "${HOME}/Downloads")
defaults write com.apple.screencapture target -string "file"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# timer (default: none)
# none = 0
# 5 seconds = 5
# 10 seconds = 10
defaults write com.apple.screencapture captureDelay -int 0

# show floating thumbnail (default: on)
defaults write com.apple.screencapture show-thumbnail -bool true

# remember last selection (default: on)
defaults write com.apple.screencapture save-selections -bool true

# show mouse pointer (default: off)
defaults write com.apple.screencapture showsCursor -bool false

### hidden screenshot tweaks

# save screenshots in png format (default: png)
# other options: bmp, gif, jpg, pdf, tiff
defaults write com.apple.screencapture type -string "png"

# disable shadow in screenshots (default: off)
# true = shadow disabled
# false = shadow enabled
defaults write com.apple.screencapture disable-shadow -bool true