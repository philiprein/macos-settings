#!/bin/zsh

echo "Battery settings..."

# depending on your model, you may or may not see some of the settings here
# if you are missing something, have a look at the hidden settings section below

# check current settings
# pmset -g
# pmset -g custom
# sudo systemsetup -getsleep
# sudo systemsetup -getwakeonnetworkaccess

# low power mode (default: never)
# never
sudo pmset -a lowpowermode 0 2>/dev/null
# always
# sudo pmset -a lowpowermode 1 2>/dev/null
# only on battery
# sudo pmset -b lowpowermode 1 2>/dev/null
# sudo pmset -c lowpowermode 0 2>/dev/null
# only on power adapter
# sudo pmset -b lowpowermode 0 2>/dev/null
# sudo pmset -c lowpowermode 1 2>/dev/null

# optimized battery charging (default: on) (needs reboot)
sudo defaults write com.apple.smartcharging.topoffprotection enabled -bool false


### options...

# slightly dim the display on battery (default: on)
# on = 1
# off = 0
sudo pmset -b lessbright 0
sudo pmset -c lessbright 0

# prevent automatic sleeping on power adapter when the display is off (default: off)
# on = 1
# off = 0
sudo pmset -c sleep 0

# wake for network access
# never
sudo pmset -a womp 0 2>/dev/null
# always
# sudo pmset -a womp 1 2>/dev/null
# only on power adapter
# sudo pmset -b womp 0 2>/dev/null
# sudo pmset -c womp 1 2>/dev/null

# optimize video streaming while on battery (default: off)
# off = 0
# on = 1
sudo defaults write /Library/Preferences/.GlobalPreferences.plist com.apple.coremedia.optimizeVideoStreamingOnBattery -int 0


### hidden battery tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# put hard disks to sleep when possible (default: always)
# sudo pmset -a disksleep 0 2>/dev/null
# always
sudo pmset -a disksleep 10 2>/dev/null
# only on battery (should only be used with -c sleep 0)
# sudo pmset -b disksleep 10 2>/dev/null
# sudo pmset -c disksleep 0 2>/dev/null 
# only on power adapter (should only be used with -b sleep 0)
# sudo pmset -b disksleep 0 2>/dev/null 
# sudo pmset -c disksleep 10 2>/dev/null

# automatic graphics switching (default: auto switch)
# integrated (less powerfull) = 0
# dedicated (separate graphics card) = 1
# auto switch = 2
sudo pmset -a gpuswitch 2

# enable power nap (default: never)
# never
sudo pmset -a powernap 0 2>/dev/null
# always
# sudo pmset -a powernap 1 2>/dev/null
# only on battery
# sudo pmset -b powernap 1 2>/dev/null
# sudo pmset -c powernap 0 2>/dev/null
# only on power adapter
# sudo pmset -b powernap 0 2>/dev/null
# sudo pmset -c powernap 1 2>/dev/null

# prevent automatic sleeping on battery when the display is off
sudo pmset -b sleep 0

# lid wake
# sudo pmset -a lidwake 1

# restart automatically on power loss
# sudo pmset -a autorestart 1

# set standby delay to 24 hours (default is 1 hour: standbydelayhigh 86400, standbydelaylow 10800)
# sudo pmset -a standbydelay 86400

# never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off >/dev/null

# hibernation mode (default: 3)
# disable hibernation (speeds up entering sleep mode) = 0
# copy ram to disk so the system state can still be restored in case of a power failure = 3
sudo pmset -a hibernatemode 3

# restart automatically if the computer freezes (default: on)
# sudo systemsetup -setrestartfreeze on

# halfdim - display sleep will use an intermediate half-brightness state between full brightness and fully off (boolean)
# 0 = off
# 1 = on
# sudo pmset -a halfdim 1

# energy powermode
# check with pmset -g custom
# 0 = automatic
# 1 = low power
# 2 = high power
# sudo pmset -b powermode 0
# sudo pmset -c powermode 0