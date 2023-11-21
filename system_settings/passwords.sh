#!/bin/zsh

echo "Passwords settings..."

# detect leaked passwords
defaults write com.apple.Safari PasswordBreachDetectionOn -bool true

# autofill passwords
defaults write com.apple.Safari AutoFillPasswords -bool false