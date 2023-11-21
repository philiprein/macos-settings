#!/bin/zsh

echo "Battery settings..."

# depending on your model, you may or may not see some of the settings here

# check current settings
# pmset -g
# pmset -g custom
# sudo systemsetup -getsleep
# sudo systemsetup -getwakeonnetworkaccess

# low power mode
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


### options...

# enable power nap
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

# put hard disks to sleep when possible
# never (should only be used with sleep 0)
# sudo pmset -a disksleep 0 2>/dev/null
# always
sudo pmset -a disksleep 10 2>/dev/null
# only on battery (should only be used with -c sleep 0)
# sudo pmset -b disksleep 10 2>/dev/null
# sudo pmset -c disksleep 0 2>/dev/null 
# only on power adapter (should only be used with -b sleep 0)
# sudo pmset -b disksleep 0 2>/dev/null 
# sudo pmset -c disksleep 10 2>/dev/null

# wake for network access
# never
sudo pmset -a womp 0 2>/dev/null
# always
# sudo pmset -a womp 1 2>/dev/null
# only on battery
# sudo pmset -b womp 1 2>/dev/null
# sudo pmset -c womp 0 2>/dev/null
# only on power adapter
# sudo pmset -b womp 0 2>/dev/null
# sudo pmset -c womp 1 2>/dev/null

# automatic graphics switching
# integrated (less powerfull) = 0
# dedicated (separate graphics card) = 1
# auto switch (default) = 2
sudo pmset -a gpuswitch 2


# settings I don't see on my macbook pro 2017
# TODO
# hidden settings

# optimized battery charging (needs reboot)
# sudo defaults write com.apple.smartcharging.topoffprotection enabled -bool false

# set standbydelay on battery and ac power delay to 10 min (default is 3 hours = 10800), set in seconds
# sudo pmset -a standbydelay 600

# lid wake
# sudo pmset -a lidwake 1

# restart automatically on power loss
# sudo pmset -a autorestart 1

# Sleep the display after 15 minutes
# sudo pmset -a displaysleep 15

# Disable machine sleep while charging
# sudo pmset -c sleep 0

# Set machine sleep to 5 minutes on battery
# sudo pmset -b sleep 5

# Set standby delay to 24 hours (default is 1 hour: standbydelayhigh 86400, standbydelaylow 10800)
# Reverse with `sudo pmset -a standbydelaylow 10800`
# sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off >/dev/null

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
# sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
#sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
#sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
#sudo chflags uchg /private/var/vm/sleepimage

# Restart automatically if the computer freezes (default: on)
# sudo systemsetup -setrestartfreeze on

# halfdim - display sleep will use an intermediate half-brightness state between full brightness and fully off (boolean)
# 0 = off
# 1 = on

# on battery
# sudo pmset -b sleep 20 disksleep 15 displaysleep 10 halfdim 1

# on power adapter
# sudo pmset -c sleep 20 disksleep 15 displaysleep 10 halfdim 1

# disable automatic sleep when display off on ac power (should only be used with disksleep 0)
# sudo pmset -c sleep 0

## energy powermode
# check with pmset -g custom
# 0 = automatic
# 1 = low power
# 2 = high power
# sudo pmset -b powermode 0
# sudo pmset -c powermode 0

# optimize videostreaming when on battery
# 0 = disabled
# 1 = enabled
# sudo defaults write /Library/Preferences/.GlobalPreferences.plist com.apple.coremedia.optimizeVideoStreamingOnBattery -int 0