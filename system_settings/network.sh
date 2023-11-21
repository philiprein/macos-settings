#!/bin/zsh

echo "Network settings..."

### firewall

# help
#/usr/libexec/ApplicationFirewall/socketfilterfw -h

# turn on firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on &>/dev/null

# do not block all incoming connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setblockall off &>/dev/null

# allow built-in software to receive incoming connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned on &>/dev/null

# allow downloaded signed software to receive incoming connections
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp on &>/dev/null

# disable stealth mode
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off &>/dev/null