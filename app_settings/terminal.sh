#!/bin/zsh

echo "Terminal settings..."

# install solarized dark theme for terminal
# source: https://github.com/mathiasbynens/dotfiles/blob/main/init/Solarized%20Dark%20xterm-256color.terminal
PATH_TO_THEME="$(cd -- "$(dirname -- "${(%):-%x}")" && cd .. && pwd)/etc/Solarized Dark.terminal"

if [[ -f $PATH_TO_THEME ]]; then
  # install solarized dark theme and set as default
  osascript <<EOD
    tell application "Terminal"
      set themeName to "Solarized Dark"

      -- Check if the theme is already imported
      if not (exists (settings set themeName)) then
        local initialOpenWindows
        local allOpenWindows

        -- Store the IDs of all open terminal windows
        set initialOpenWindows to id of every window

        -- Open the custom theme to add it to available themes
        do shell script "open '$PATH_TO_THEME'"

        -- Wait a bit to ensure the theme is added
        delay 1

        -- Get the IDs of all currently open windows
        set allOpenedWindows to id of every window

        -- Close additional windows opened for theme import
        repeat with windowID in allOpenedWindows
          if initialOpenWindows does not contain windowID then
            close (every window whose id is windowID)
          end if
        end repeat
      end if

      -- Set the custom theme as the default
      set default settings to settings set themeName

      -- Apply the theme to already opened windows
      repeat with aWindow in every window
        set current settings of tabs of aWindow to settings set themeName
      end repeat
    end tell
EOD
else
  # set pre-installed pro theme as default
  osascript -e 'tell application "Terminal" to set default settings to settings set "Pro"'
fi


### general

# on startup, open new window with profile
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"

# shells open with
# default login shell = ""
# command (complete path) = e.g. "/bin/zsh"
defaults write com.apple.terminal Shell -string ""

# new windows open with
# default profile
defaults delete com.apple.terminal NewWindowSettingsBehavior
# same profile
# defaults write com.apple.terminal NewWindowSettingsBehavior -int 2
# default working directory
defaults delete com.apple.terminal NewWindowWorkingDirectoryBehavior
# same working directory
# defaults write com.apple.terminal NewWindowWorkingDirectoryBehavior -int 2

# new tabs open with
# same profile
defaults delete com.apple.terminal NewTabSettingsBehavior
# default profile
# defaults write com.apple.terminal NewTabSettingsBehavior -int 1
# same working directory
defaults delete com.apple.terminal NewTabWorkingDirectoryBehavior
# default working directory
# defaults write com.apple.terminal NewTabWorkingDirectoryBehavior -int 1

# use cmd-1 through cmd-9 to switch tabs
# yes
defaults delete com.apple.terminal Command1Through9SwitchesTabs
# no
# defaults write com.apple.terminal Command1Through9SwitchesTabs -bool false


### window groups



### encodings

# only use utf-16
defaults write com.apple.terminal StringEncodings -array 10

# only use utf-8
# defaults write com.apple.terminal StringEncodings -array 4


### hidden terminal tweaks

# settings that are commented out couldn't be validated to see if they were out of date or not

# secure keyboard entry
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# enable "focus follows mouse" for Terminal.app and all X11 apps, i.e. hover over a window and start typing in it without clicking first
# defaults write com.apple.terminal FocusFollowsMouse -bool true
# defaults write org.x.X11 wm_ffm -bool true

# disable line marks
defaults write com.apple.Terminal ShowLineMarks -int 0