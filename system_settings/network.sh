#!/bin/zsh

echo "Network settings..."

### firewall

# help
# /usr/libexec/ApplicationFirewall/socketfilterfw -h

# firewall (default: on)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on &>/dev/null

# block all incoming connections (default: off)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off &>/dev/null

# automatically allow built-in software to receive incoming connections (default: on)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on &>/dev/null

# automatically allow downloaded signed software to receive incoming connections (default: on)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on &>/dev/null

# disable stealth modeb (default: off)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off &>/dev/null