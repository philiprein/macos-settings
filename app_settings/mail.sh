#!/bin/zsh

echo "Mail settings..."

### general

# default email reader
# TODO

# check for new messages (default: automatically)
# automatically = -1, true
# every minute = 1, true
# every 5 minutes = 5, true
# every 15 minutes = 15, true
# every 30 minutes = 30, true
# every hour = 60, true
# manually = 0, false
defaults write com.apple.mail PollTime -int -1
defaults write com.apple.mail AutoFetch -bool true

# new messages sound (default: new messages sound)
# none = ""
# new messages sound = "New Mail"
defaults write com.apple.mail MailSound -string ""

# play sounds for other mail actions (default: on)
defaults write com.apple.mail PlayMailSounds -bool true

# dock unread count (default: inbox only)
# inbox only = 1
# all mailboxes = 2
defaults write com.apple.mail MailDockBadge -int 1

# new message notifications (default: inbox only)
# inbox only = 1
# vips = 2
# contacts = 3
# all mailboxes = 5
defaults write com.apple.mail MailUserNotificationScope -int 1

# downloads folder
# TODO

# remove unedited downloads (default: after message is deleted)
# each attachment that is opened gets "downloaded" (pop3 and imap)
# files are stored in "~/Library/Containers/com.apple.mail/Data/Library/Mail Downloads/"
# never = 0, false
# when mail quits = 0, true
# after message is deleted = 2147483647, true
defaults write com.apple.mail DeleteAttachmentsAfterHours -int 0
defaults write com.apple.mail DeleteAttachmentsEnabled -bool true

# follow up suggestions  
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" DisableFollowUp -bool true

# archive or delete muted messages (default: off)
defaults write com.apple.mail ArchiveOrDeleteMutedMessagesKey -bool false

# automatically try sending later if outgoing server for sending is unavailable (default: off)
defaults write com.apple.mail SuppressDeliveryFailure -bool false

# prefer opening messages in split view when in full screen (default: on)
defaults write com.apple.mail FullScreenPreferSplit -bool true

# when searching all mailboxes, include results from:
# trash (default: on)
defaults write com.apple.mail IndexTrash -bool true
# junk (default: off)
defaults write com.apple.mail IndexJunk -bool true
# encrypted messages (default: off)
defaults write com.apple.mail IndexDecryptedMessages -bool true


### accounts


### junk mail

# junk mail behaviors
# enabled junk mail filtering (default: off)
# TODO

# blocked
# enabled junk mail filtering (default: on)
# TODO

# when email from blocked address arrives:
# mark as blocked mail, but leave it in my inbox
# TODO
# move it to the trash
# TODO


### fonts & colors

# message list font
# TODO

# message font
# TODO

# fixed-width font
# TODO

# use fixed-width font for plain text messages
defaults write com.apple.mail AutoSelectFont -bool false

# show quoted text in colors
defaults write com.apple.mail ColorQuoterColorIncoming -bool true


### viewing

# list preview (default: 2 lines)
# none = 0
# x lines = x
defaults write com.apple.mail NumberOfSnippetLines -int 0

# move discarded messages into (default: trash)
# trash = 0
# archive = 1
defaults write com.apple.mail SwipeAction -int 0

# show message headers (default: default)
# TODO

# display unread messages with bold font (default: off)
defaults write com.apple.mail ShouldShowUnreadMessagesInBold -bool true

# use smart addresses (default: off)
# use = 4
# don't use = 3
defaults write com.apple.mail-shared AddressDisplayMode -int 4

# use dark backgrounds for messages (default: on)
# only visible in dark mode
defaults write com.apple.mail ViewMessagesWithDarkBackgrounds -bool true

# highlight messages with color when not grouped (default: on)
defaults write com.apple.mail HighlightCurrentThread -bool true
# defaults write com.apple.mail ThreadBackgroundColor -int 477638

# include related messages (default: on)
defaults write com.apple.mail ConversationViewSpansMailboxes -bool true

# mark all messages as read when opening a conversation (default: off)
defaults write com.apple.mail ConversationViewMarkAllAsRead -bool false

# show most recent message at the top (default: off)
defaults write com.apple.mail ConversationViewSortDescending -bool true


### composing

# message format (default: rich text)
# rich text = MIME
# plain text = Plain
defaults write com.apple.mail SendFormat -string MIME

# check spelling (default: as i type)
# as i type = InlineSpellCheckingEnabled
# when i click send = SpellCheckingOnSendEnabled
# never = NoSpellCheckingEnabled
defaults write com.apple.mail SpellCheckingBehavior -string InlineSpellCheckingEnabled

# automatically (default: off)
# cc:
defaults write com.apple.mail ReplyToSelf -bool false
# bcc:
defaults write com.apple.mail BccSelf -bool false
# myself

# add link previews (default: on)
defaults write com.apple.mail AddLinkPreviews -bool true

# when sending to a group, show all member addresses (default: on)
defaults write com.apple.mail-shared ExpandPrivateAliases -bool true

# mark addresses not ending with (default: off)
defaults write com.apple.mail-shared AlertForNonmatchingDomains -bool false
# defaults write com.apple.mail-shared DomainForMatching -array-add "@gmail.com"

# send new messages from (default: automatically select best account)
# automatically select best account = ""
# defaults write com.apple.mail-shared NewMessageFromAddress ""

# undo send delay (default: 10)
# time in seconds = value
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" UndoSendDelayTime -int 10

# use the same message format as the original message (default: off)
defaults write com.apple.mail AutoReplyFormat -bool false

# quote the text of the original message (default: on)
defaults write com.apple.mail ReplyQuotesOriginal -bool true

# increase quote level (default: on)
# enabled = false
# disabled = true
defaults write com.apple.mail SupressQuoteBarsInComposeWindows -bool false

# when quoting text in replies or forwards (default: include selected text, if any; otherwise include all text)
# include all of the original message text = true
# include selected text, if any; otherwise include all text = false
defaults write com.apple.mail AlwaysIncludeOriginalMessage -bool true


### signatures

# always match my default message font
# for enabling set SignatureIsRich -bool true in
# ~/Library/Mail/V*/MailData/Signatures/AllSignatures.plist
# ~/Library/Mail/V*/MailData/Signatures/SignaturesByAccount.plist

# place signature above quoted text
defaults write com.apple.mail SignaturePlacedAboveQuotedText -bool true


### rules

# to migrate rules to a new mac, follow these steps:
# quit apple mail
# go to /Users/$USER/Library/Mail/VX/MailData/ (X = 10 for ventura, 11 for sonoma, etc.) in your backup
# copy RulesActiveState.plist, SyncedRules.plist, UnsyncedRules.plist to the corresponding folder in your target system
# TODO: automate this


### extensions
# TODO


### privacy

# protect mail activity (default: set when first opening mail)
# protect mail activity on = 1
# protect mail activity off; hide ip address on; block all remote content off = 9
# protect mail activity off; hide ip address on; block all remote content on = 11
# protect mail activity off; hide ip address off; block all remote content off = 13
# protect mail activity off; hide ip address off; block all remote content on = 15
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" LoadRemoteContent-v2 -int 1


### view settings

# show/hide tab bar (default: off)
defaults write com.apple.mail "NSWindowTabbingShoudShowTabBarKey-MouseTrackingWindow-MessageViewer-(null)-VT-FS" -bool false

# use column layout (default: off)
defaults write com.apple.mail BottomPreview -bool true
defaults write com.apple.mail ColumnLayoutMessageList -bool true

# show bottom/side preview (default: off)
defaults write com.apple.mail BottomPreview -bool false

# show date and time (default: off)
defaults write com.apple.mail MessageListShowDateTime -bool true

# show to/cc label (default: off)
defaults write com.apple.mail EnableToCcInMessageList -bool false

# show message size (default: off)
defaults write com.apple.mail MessageListShowSize -bool false

# show contact photo (default: off)
defaults write com.apple.mail EnableContactPhotos -bool false

# highlight conversations (default: off)
defaults write com.apple.mail HighlightClosedThreads -bool false

# cc address field (default: off)
defaults write com.apple.mail ShowCcHeader -bool true

# bcc address field (default: off)
defaults write com.apple.mail ShowBccHeader -bool true

# reply-to address field (default: off)
defaults write com.apple.mail ShowReplyToHeader -bool false

# show/hide sidebar (default: on)
# TODO

# show/hide toolbar (default: on)
# TODO

# show/hide favorites bar (default: off)
# TODO


### hidden mail tweaks

# settings that are commented out are out of date or couldn't be validated to see if they were out of date or not

# display emails in threaded mode, sorted by date
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "YES"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedAscending" -string "YES"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "NO"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# copy email addresses as "foo@example.com" instead of "Foo Bar <foo@example.com>"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# disable send and reply animations
# doesn't seem to work anymore
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true

# disable inline attachments (just show the icons, e.g. for single-page pdfs)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# always add attachments at the end of messages
defaults write com.apple.mail AttachAtEnd -bool true

# always send attachments windows friendly
defaults write com.apple.mail SendWindowsFriendlyAttachments -bool true

# flag color to display
# orange = 1
# defaults write com.apple.mail FlagColorToDisplay -int 1

# grammar checking
defaults write com.apple.mail WebGrammarCheckingEnabled -bool false

# spelling checking
defaults write com.apple.mail WebContinuousSpellCheckingEnabled -bool true

# automatic spelling correction
defaults write com.apple.mail WebAutomaticSpellingCorrectionEnabled -bool false

# un-collapse favorites
defaults write com.apple.mail UserDidCollapseFavoritesSectionKey -bool false