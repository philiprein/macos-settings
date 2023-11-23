#!/bin/zsh

echo "Appearance settings..."

# appearance (default: set in setup assistant or light) (needs logout)
# check: defaults read NSGlobalDomain | grep AppleInterfaceStyle
# light
defaults delete NSGlobalDomain AppleInterfaceStyle
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool false
# dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool false
# automatic
defaults delete NSGlobalDomain AppleInterfaceStyle
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# accent color (default: multicolor)
# red = 0
# orange = 1
# yellow = 2
# green = 3
# blue = 4
# violet = 5
# pink = 6
# graphit = -1
# multicolor = defaults delete NSGlobalDomain AppleAccentColor
defaults write NSGlobalDomain AppleAccentColor -int 4

# highlight color (default: accent color)
# example blue
defaults write NSGlobalDomain AppleHighlightColor -string "0.698039 0.843137 1.000000 Blue"
# reset to default
defaults delete NSGlobalDomain AppleHighlightColor

# sidebar icon size (default: medium)
# small = 1
# medium = 2
# big = 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# allow wallpaper tinting in windows (default: on)
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool true

# show scroll bars (default: Automatic)
# automatically based on mouse or trackpad = Automatic
# when scrolling = WhenScrolling
# always = Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# click in the scroll bar to (default: false)
# jump to the next page = false
# jump to the spot that's clicked = true
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool false
