#!/bin/zsh

echo "Appearance settings..."

# appearance (needs logout)
# defaults read -g | grep AppleInterfaceStyle

# light
defaults delete -g AppleInterfaceStyle &>/dev/null
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool false

# dark
# defaults delete -g AppleInterfaceStyle &>/dev/null
# defaults write -g AppleInterfaceStyle -string "Dark"
# defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool false

# automatic
# defaults delete -g AppleInterfaceStyle &>/dev/null
# defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

# accent color
# 0 = red
# 1 = orange
# 2 = yellow
# 3 = green
# 4 = blue
# 5 = violet
# 6 = pink
# -1 = graphit
# defaults delete -g AppleAccentColor = multicolor
defaults write -g AppleAccentColor -int 4

# highlight color
# example blue
# defaults write NSGlobalDomain AppleHighlightColor -string "0.698039 0.843137 1.000000 Blue"
# reset to default (same as accent color)
defaults delete -g AppleHighlightColor &>/dev/null

# sidebar icon size
# 1 = small, 2 = medium, 3 = big
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# allow wallpaper tinting in windows
# true = no translucent windows
# false = slightly translucent windows
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool false

# show scroll bars
# possible values: WhenScrolling, Automatic, Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# click in the scroll bar to
# false = jump to the next page
# true = jump to the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -bool true