#!/bin/zsh

echo "Screen Time settings..."

# enable (needs logout)
#defaults write com.apple.ScreenTimeAgent ScreenTimeEnabled -bool true

# disbale (needs logout)
defaults write com.apple.ScreenTimeAgent ScreenTimeEnabled -bool false