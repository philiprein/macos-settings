#!/bin/zsh

echo "Trackpad settings..."

# macbook trackpad: com.apple.AppleMultitouchTrackpad
# bluetooth trackpad: com.apple.driver.AppleBluetoothMultitouch.trackpad

### point & click

# trackpad speed (default: 0.6875)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.875

# click (default: medium)
# light = 0
# medium = 1
# firm = 2
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 1
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 1

# silent clicking (default: off)
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -bool false

# force click and haptic feedback & look up & data detectors (default: on & force click with one finger)
# off & off = false, 0, true, 0, 0, 0
# off & on = false, 0, true, 2, 2, 2
# on & off = false, 1, false, 0, 0, 0
# on & force click with one finger = true, 1, false, 0, 0, 0
# on & tap with three fingers = false, 1, false, 2, 2, 2
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 2

# secondary click (default: click with two fingers)
# off = false, false, false, false, 0, 0, 0
# click with two fingers = true, true, true, true, 0, 0, 0
# click in bottom right corner = true, false, false, false, 2, 2, 1
# click in bottom left corner = true, false, false, false, 1, 1, 3
defaults write NSGlobalDomain ContextMenuGesture -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpadCornerClickBehavior -int 0

# tab to click (default: off)
# on = false, false, 0
# off = true, true, 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 0


### scroll & zoom

# natural scrolling (default: on)
# also set in mouse settings
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# zoom in or out (default: on)
# on = true
# off = false
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.pinchGesture -bool true

# smart zoom (default: on)
# on = 1
# off = 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 1

# rotate (default: on)
# on = true
# off = false
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.rotateGesture -bool true


### more gestures

# swipe between pages & swipe between full-screen applications (default: scroll left or right with two fingers & swipe left or right with three fingers)
# off & off = false, 0, 0, 0, 0, 0, 0
# off & swipe left or right with three fingers = false, 2, 2, 2, 2, 2, 2
# off & swipe left or right with four fingers = false, 0, 0, 0, 2, 2, 2
# scroll left or right with two fingers & off = true, 0, 0, 0, 0, 0, 0
# scroll left or right with two fingers & swipe left or right with three fingers = true, 2, 2, 2, 2, 2, 2
# scroll left or right with two fingers & swipe left or right with four fingers = true, 0, 0, 0, 2, 2, 2
# swipe with three fingers & off = false, 1, 1, 1, 0, 0, 0
# swipe with three fingers & swipe left or right with four fingers = false, 1, 1, 1, 2, 2, 2
# swipe with two or three fingers & off = true, 1, 1, 1, 0, 0, 0
# swipe with two or three fingers & swipe left or right with four fingers = true, 1, 1, 1, 2, 2, 2
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture -int 2

# notification center (default: on)
# on = 3
# off = 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 3

# mission control & app expose (default: swipe up with three fingers & off)
# off & off = false, false, 1, 1, 1, 2, 2, 2
# swipe up with three fingers & off = true, false, 2, 2, 2, 2, 2, 2
# swipe up with four fingers & off = true, false, 1, 1, 1, 2, 2, 2
# swipe up with three fingers & swipe down with three fingers = true, true, 2, 2, 2, 2, 2, 2
# swipe up with four fingers & swipe down with four fingers = true, true, 1, 1, 1, 2, 2, 2
# off & swipe down with four fingers = false, true, 1, 1, 1, 2, 2, 2
# off & swipe down with three fingers = false, true, 2, 2, 2, 2, 2, 2
defaults write com.apple.dock showMissionControlGestureEnabled -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 2

# launchpad & show desktop (default: on & on)
# off & off = false, false, 0, 0, 0, 0, 0, 0
# off & on = false, true, 2, 2, 2, 2, 2, 2
# on & off = true, false, 2, 2, 2, 2, 2, 2
# on & on = true, true, 2, 2, 2, 2, 2, 2
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
defaults write com.apple.dock showDesktopGestureEnabled -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2