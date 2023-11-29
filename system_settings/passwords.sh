#!/bin/zsh

echo "Passwords settings..."

### security recommendations

# detect leaked passwords (default: on)
defaults write com.apple.Safari PasswordBreachDetectionOn -bool true


### password options

# autofill passwords and passkeys (default: off)
defaults write com.apple.Safari AutoFillPasswords -bool false

# use passwords and passkeys from
# keychain (default: on)
defaults write com.apple.Safari AutoFillFromiCloudKeychain -bool false

# clean up automatically (default: off)
defaults write com.apple.onetimepasscodes DeleteVerificationCodes -bool true