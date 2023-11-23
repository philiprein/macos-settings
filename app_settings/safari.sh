#!/bin/zsh

echo "Safari settings..."

### general

# safari opens with (default: all windows from last session)
# the options you see here depend on wether you have system wide resume enabled or not
# see desktop_and_dock.sh or
# system settings -> desktop & dock -> close windows when quitting an application
# a new window = false, false, false
# a new private window = false, true, false
# all windows from last session = true, false, false
# all non-private windows from last session = true, false, true
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false
defaults write com.apple.Safari ExcludePrivateWindowWhenRestoringSessionAtLaunch -bool false

# new windows open with (default: start page)
# start page = 4
# homepage = 0
# empty page = 1
# same page = 2
# tabs for favorites = 5
defaults write com.apple.Safari NewWindowBehavior -int 4

# new tabs open wit (default: start page)
# start page = 4
# homepage = 0
# empty page = 1
# same page = 2
defaults write com.apple.Safari NewTabBehavior -int 4

# homepage (default: https://www.apple.com/startpage)
defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari DidMigrateDownloadFolderToSandbox -bool false
defaults write com.apple.Safari DidMigrateResourcesToSandbox -bool false
defaults read com.apple.Safari >/dev/null 2>&1
defaults write com.apple.Safari.SandboxBroker Homepage -string "about:blank"
defaults write com.apple.Safari.SandboxBroker DidMigrateDownloadFolderToSandbox -bool false
defaults write com.apple.Safari.SandboxBroker DidMigrateResourcesToSandbox -bool false
defaults read com.apple.Safari.SandboxBroker >/dev/null 2>&1

# remove history items (default: after one year)
# after one day = 1
# after one week = 7
# after two weeks = 14
# after one month = 30
# after one year = 365
# manually = 365000
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 30

# start page favorites (default: favorites)
# change settings once and read with
# defaults read com.apple.Safari FavoritesViewCollectionBookmarkUUID
# set to UUID of your favorites folder
# defaults write com.apple.Safari FavoritesViewCollectionBookmarkUUID -string ""

# file download location (default: downloads)
# ask for each download
defaults write com.apple.Safari.SandboxBroker AlwaysPromptForDownloadFolder -bool true
# download path
defaults write com.apple.Safari DownloadsPath "${HOME}/Downloads"
defaults write com.apple.Safari DidMigrateDownloadFolderToSandbox -bool false
defaults write com.apple.Safari DidMigrateResourcesToSandbox -bool false
defaults read com.apple.Safari >/dev/null 2>&1
defaults write com.apple.Safari.SandboxBroker DownloadLocation "${HOME}/Downloads"
defaults write com.apple.Safari.SandboxBroker DidMigrateDownloadFolderToSandbox -bool false
defaults write com.apple.Safari.SandboxBroker DidMigrateResourcesToSandbox -bool false
defaults read com.apple.Safari.SandboxBroker >/dev/null 2>&1

# remove download list items (default: after one day)
# after one day = 3
# when safari quits = 1
# upon successful download = 2
# manually = 0
defaults write com.apple.Safari DownloadsClearingPolicy -int 1

# open safe files after downloading (default: on)
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


### tabs

# tab layout (default: seperate)
# seperate = true
# compact = false
defaults write com.apple.Safari ShowStandaloneTabBar -bool true

# always show website titles in tabs (default: off)
# if turned of tabs stay the same size and you have to scroll through them
defaults write com.apple.Safari EnableNarrowTabs -bool false

# open pages in tabs instead of windows (default: automatically)
# never = 0
# automatically = 1
# always = 2
defaults write com.apple.Safari TabCreationPolicy -int 1

# automatically close tabs (default: manually)
# manually = 0
# after one day = 1
# after one week = 2
# after one month = 3
defaults write com.apple.Safari CloseTabsAutomatically -int 0

# cmd-click opens a link in a new tab (default: on)
defaults write com.apple.Safari CommandClickMakesTabs -bool true

# when a new tab or window opens, make it active (default: off)
defaults write com.apple.Safari OpenNewTabsInFront -bool true

# use cmd-1 through cmd-9 to switch tabs (default: on)
defaults write com.apple.Safari Command1Through9SwitchesTabs -bool true


### autofill

# using information from my contacts (default: on)
defaults write com.apple.Safari AutoFillFromAddressBook -bool false

# user names and passwords (default: on)
defaults write com.apple.Safari AutoFillPasswords -bool false

# credit cards (default: on)
defaults write com.apple.Safari AutoFillCreditCardData -bool false

# other forms (default: on)
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false


### passwords

# same as in system settings -> passwords

### security recommendations

# detect leaked passwords (default: on)
defaults write com.apple.Safari PasswordBreachDetectionOn -bool true


### autofill passwords and passkeys

# autofill passwords and passkeys (default: off)
defaults write com.apple.Safari AutoFillPasswords -bool false

# use passwords and passkeys from
# keychain (default: on)
defaults write com.apple.Safari AutoFillFromiCloudKeychain -bool false

# clean up automatically (default: off)
defaults write com.apple.onetimepasscodes DeleteVerificationCodes -bool true


### search

# search engine (default: google)
# google
defaults write com.apple.Safari SearchProviderShortName -string "Google"
defaults write NSGlobalDomain NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = Google; NSProviderIdentifier = "com.google.www"; }; }'
# yahoo
# defaults write com.apple.Safari SearchProviderShortName -string "Yahoo!"
# defaults write NSGlobalDomain NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = "Yahoo!"; NSProviderIdentifier = "com.yahoo.www"; }; }'
# bing
# defaults write com.apple.Safari SearchProviderShortName -string "Bing"
# defaults write NSGlobalDomain NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = "Bing"; NSProviderIdentifier = "com.bing.www"; }; }'
# duckduckgo
# defaults write com.apple.Safari SearchProviderShortName -string "DuckDuckGo"
# defaults write NSGlobalDomain NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = "DuckDuckGo"; NSProviderIdentifier = "com.duckduckgo"; }; }'
# ecosia
# defaults write com.apple.Safari SearchProviderShortName -string "Ecosia"
# defaults write NSGlobalDomain NSPreferredWebServices '{NSWebServicesProviderWebSearch = { NSDefaultDisplayName = "Ecosia"; NSProviderIdentifier = "org.ecosia.www"; }; }'

# private browsing search engine (default: default)
# default
# defaults delete com.apple.Safari PrivateSearchProviderShortName
# google
# defaults write com.apple.Safari PrivateSearchProviderShortName -string "Google"
# yahoo
# defaults write com.apple.Safari PrivateSearchProviderShortName -string "Yahoo!"
# bing
# defaults write com.apple.Safari PrivateSearchProviderShortName -string "Bing"
# duckduckgo
defaults write com.apple.Safari PrivateSearchProviderShortName -string "DuckDuckGo"
# ecosia
# defaults write com.apple.Safari PrivateSearchProviderShortName -string "Ecosia"

# include search engine suggestions (default: on)
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# include safari suggestions (default: on)
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# enable quick website search (default: on)
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool true

# preload top hit in the background (default: on)
defaults write com.apple.Safari PreloadTopHit -bool false

# show favorites (default: on)
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false


### security

# fraudulent sites: warn when visiting a fraudulent website (default: on)
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# web content: enable javascript (default: on)
defaults write com.apple.Safari WebKitJavaScriptEnabled -bool true
defaults write com.apple.Safari WebKitPreferences.javaScriptEnabled -bool true


### privacy

# website tracking: prevent cross-site tracking (default: on)
# on = 2, 1, 1
# off = 1, 0, 0
defaults write com.apple.Safari BlockStoragePolicy -int 2
defaults write com.apple.Safari "WebKitPreferences.storageBlockingPolicy" -int 1
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 1

# hide ip address: hide ip address (default: from trackers only)
# TODO
# this setting somehow gets reverted even if you try to change it
# off
# defaults write com.apple.Safari WBSPrivacyProxyAvailabilityTraffic -int 130272
# defaults write com.apple.Safari WBSPrivacyProxyAvailabilityServiceStatus -int 0
# defaults write com.apple.Safari WBSPrivacyProxyAvailabilitySubscriberTier -bool false
# from trackers only
# defaults write com.apple.Safari WBSPrivacyProxyAvailabilityTraffic -int 130276
# from trackers and websites (this requires an icloud+ subsciption)
# defaults write com.apple.Safari WBSPrivacyProxyAvailabilityTraffic -int 130284

# private browsing: require password to view locked tabs (default: on)
defaults write com.apple.Safari PrivateBrowsingRequiresAuthentication -bool true


### websites

# on a clean install safari has to be opened at least one time before the database will be created
# opening without loading a website does not trigger creating the database, so "run" is not enough, opening and loading a first website is needed
osascript -e '
  tell application "Safari"
    make new document with properties {URL:"http://www.google.com"}
    activate
    delay 3 -- wait for 3 seconds to allow the page to load
    quit
  end tell
'

SAFARI_WEBSITE_DATABASE="${HOME}/Library/Safari/PerSitePreferences.db"

# general preferences
# /Users/$USER/Library/Safari/PerSitePreferences.db
# sqlite3 /Users/$USER/Library/Safari/PerSitePreferences.db
# .tables
# .headers ON
# select * from default_preferences;
# id|preference|default_value
# xx|PerSitePreferencesCamera|1
# xx|PerSitePreferencesAutoplay|0
# xx|PerSitePreferencesUseReader|0
# xx|PerSitePreferencesContentBlockers|0
# xx|PerSitePreferencesMicrophone|0
# example
# UPDATE default_preferences SET default_value='1' WHERE preference='PerSitePreferencesCamera';
# select * from default_preferences;
# .quit

# per site preferences
# /Users/$USER/Library/Safari/PerSitePreferences.db
# sqlite3 /Users/$USER/Library/Safari/PerSitePreferences.db
# .tables
# .headers ON
# select * from preference_values;
# id|domain|preference|preference_value|timestamp
# 1|watch.nba.com|PerSitePreferencesAutoplay|0|
# example
# UPDATE preference_values SET preference_value='0' WHERE (preference='PerSitePreferencesAutoplay' and domain='watch.nba.com');
# select * from preference_values;
# .quit

# checking values
# sqlite3 "$SAFARI_WEBSITE_DATABASE" "select * from default_preferences;"
# sqlite3 "$SAFARI_WEBSITE_DATABASE" "select * from preference_values;"

# resetting / deleting values
# sqlite3 "$SAFARI_WEBSITE_DATABASE" "delete from default_preferences WHERE preference='PerSitePreferencesMicrophone';"
# sqlite3 "$SAFARI_WEBSITE_DATABASE" "delete from preference_values WHERE preference='PerSitePreferencesMicrophone';"

# reader (default: off)
# off = 0
# on = 1
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesUseReader") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesUseReader', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesUseReader'"
fi

# use content blocker (default: on)
# this does not enable an integrated safari blocker but gives the permission to use seperate content blockers
# off = 0
# on = 1
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesContentBlockers") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesContentBlockers', '1');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='1' WHERE preference='PerSitePreferencesContentBlockers'"
fi

# autoplay media (default: stop media with sound)
# allow all auto-play = 0
# stop media with sound = 1
# never auto-play = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesAutoplay") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesAutoplay', '1');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='1' WHERE preference='PerSitePreferencesAutoplay'"
fi

# page zoom (default: 100%)
# 100% = 1
# 125% = 1.25
# ...
defaults write com.apple.Safari DefaultPageZoom -float 1

# camera (default: ask)
# ask = 0
# deny = 1
# allow = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesCamera") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesCamera', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesCamera'"
fi

# microphone (default: ask)
# ask = 0
# deny = 1
# allow = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesMicrophone") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesMicrophone', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesMicrophone'"
fi

# screen sharing (default: ask)
# adds entries to "$HOME"/Library/Safari/UserMediaPermissions.plist
# ask = 0
# do not allow = 1
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesStoreKeyScreenCapture") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesStoreKeyScreenCapture', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesStoreKeyScreenCapture'"
fi

# location (default: ask)
# website use of location services
# location services in system settings have to be enabled if option shall be enabled
# 0 = deny without prompting
# 1 = prompt for each website once each day
# 2 = prompt for each website one time only
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 1
# ask = 0
# deny = 1
# allow = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesGeolocation") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesGeolocation', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesGeolocation'"
fi

# downloads (default: ask)
# allow = 0
# ask = 1
# not allow = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesDownloads") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesDownloads', '1');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='1' WHERE preference='PerSitePreferencesDownloads'"
fi

# notifications
# allow websites to ask for permission to send notifications (default: on)
defaults write com.apple.Safari CanPromptForPushNotifications -bool false

# pop-up windows (default: block and notify)
# block and notify = 0
# block = 1
# allow = 2
if [[ $(sqlite3 "$SAFARI_WEBSITE_DATABASE" "SELECT * from default_preferences;" | grep "PerSitePreferencesPopUpWindow") == "" ]]; then
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "INSERT INTO default_preferences (preference, default_value) values ('PerSitePreferencesPopUpWindow', '0');"
else
    sqlite3 "$SAFARI_WEBSITE_DATABASE" "UPDATE default_preferences SET default_value='0' WHERE preference='PerSitePreferencesPopUpWindow'"
fi

# extensions
# done in extensions below


### profiles
# TODO


### extensions
# TODO

# enable extensions (default: on)
defaults write com.apple.Safari ExtensionsEnabled -bool true

# SAFARI_APP_EXTENSIONS_CONFIG_FILE="${HOME}/Library/Containers/com.apple.Safari/Data/Library/Safari/AppExtensions/Extensions.plist"
# SAFARI_WEB_EXTENSIONS_CONFIG_FILE="${HOME}/Library/Containers/com.apple.Safari/Data/Library/Safari/WebExtensions/Extensions.plist"


### advanced

# smart search field: show full website address (default: off)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# accessibility: never use font sizes smaller than (default: off)
# off = 0
# on = value for respective font size
defaults write com.apple.Safari WebKitMinimumFontSize -int 0
defaults write com.apple.Safari WebKitPreferences.minimumFontSize -int 0

# accessibility: press tab to highlight each item on a webpage (default: off)
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool false
defaults write com.apple.Safari WebKitPreferences.tabFocusesLinks -bool false

# accessibility: show color in compact tab bar (default: on)
defaults write com.apple.Safari NeverUseBackgroundColorInToolbar -bool true

# privacy: use advanced tracking and fingerprinting protection (default: in private browsing)
# off = false, false
# in private browsing = true, false
# in all browsing = true, true
defaults write com.apple.Safari EnableEnhancedPrivacyInPrivateBrowsing -bool true
defaults write com.apple.Safari EnableEnhancedPrivacyInRegularBrowsing -bool true

# privacy: allow websites to check for apple pay and apple card (default: on)
defaults write com.apple.Safari WebKitPreferences.applePayCapabilityDisclosureAllowed -bool true

# privacy: allow privacy-preserving measurement of ad effectiveness (default: on)
defaults write com.apple.Safari WebKitPreferences.privateClickMeasurementEnabled -bool false

# privacy: block all cookies (default: off)
# on = 0, 2, 2
# off = 2, 1, 1
defaults write com.apple.Safari BlockStoragePolicy -int 2
defaults write com.apple.Safari WebKitPreferences.storageBlockingPolicy -int 1
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 1

# reading list: save articles for offline reading automatically (default: off)
defaults write com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool false

# style sheet (default: none selected)
defaults write com.apple.Safari UserStyleSheetEnabled -bool false

# default encoding (default: iso latin 1)
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string "utf-8"
defaults write com.apple.Safari WebKitPreferences.defaultTextEncodingName -string "utf-8"

# proxies
# depends on network settings


# show features for web developers (default: off)
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari DeveloperMenuVisibility -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true


### developer

# automation: allow remote automation (default: off)
# TODO

# automation: allow javascript from smart search field (default: off)
defaults write com.apple.Safari UnifiedFieldSupportsJavascriptURLs -bool false

# automation: allow javascript from apple events (default: off)
defaults write com.apple.Safari AllowJavaScriptFromAppleEvents -bool false

# compatibility: disable site-specific hacks (default: off)
defaults write com.apple.Safari WebKitPreferences.needsSiteSpecificQuirks -bool true
defaults write com.apple.Safari WebKitUseSiteSpecificSpoofing -bool true

# security: disable local file restrictions (default: off)
# disable = false, true, true, true, true
# enable = true, false, false, false, false
defaults write com.apple.Safari LocalFileRestrictionsEnabled -bool true
defaults write com.apple.Safari WebKitAllowFileAccessFromFileURLs -bool false
defaults write com.apple.Safari WebKitAllowUniversalAccessFromFileURLs -bool false
defaults write com.apple.Safari WebKitPreferences.allowFileAccessFromFileURLs -bool false
defaults write com.apple.Safari WebKitPreferences.universalAccessFromFileURLsAllowed -bool false

# security: disable cross-origin restrictions (default: off)
# disable = false, false
# enable = true, true
defaults write com.apple.Safari WebKitWebSecurityEnabled -bool true
defaults write com.apple.Safari WebKitPreferences.webSecurityEnabled -bool true

# privacy: enable intelligent tracking prevention debug mode (default: off)
# TODO

# privacy: enable private click measurement debug mode (default: off)
# TODO

# extensions: allow unsigned extensions (default: off)
# TODO


### view settings

# always show tab bar (default: off)
defaults write com.apple.Safari AlwaysShowTabBar -bool true

# show/hide favorites bar (default: off)
defaults write com.apple.Safari ShowFavoritesBar -bool true
defaults write com.apple.Safari ShowFavoritesBar-v2 -bool true

# show/hide status bar (default: off)
defaults write com.apple.Safari ShowOverlayStatusBar -bool false

# show/hide sidebar (default: off)
defaults write com.apple.Safari ShowSidebarInNewWindows -bool false


### hidden safari tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# hide safaris sidebar in top sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# allow hitting the backspace key to go to the previous page in history
defaults write com.apple.Safari WebKitPreferences.backspaceKeyNavigationEnabled -bool true

# disable safaris thumbnail cache for history and top sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# enable safari debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool false

# search with "starts with" instead of "contains"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# update extensions automatically
# defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# send do not track header
# defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# topsites arrangement / display
# 6 sites = 0
# 12 sites = 1
# 24 sites = 2
# defaults write com.apple.Safari TopSitesGridArrangement -int 0

# add a context menu item for showing the web inspector in web views
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true