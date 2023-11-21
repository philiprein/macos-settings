#!/bin/zsh

echo "Mail settings..."

### general

# check for new messages
# automatically = -1, true
# every minute = 1, true
# every 5 minutes = 5, true
# every 15 minutes = 15, true
# every 30 minutes = 30, true
# every hour = 60, true
# manually = 0, false
defaults write com.apple.mail PollTime -int -1
defaults write com.apple.mail AutoFetch -bool true

# new messages sound
# None = ""
# New Messages Sound = "New Mail"
defaults write com.apple.mail MailSound -string ""

# play sounds for other mail actions
defaults write com.apple.mail PlayMailSounds -bool true

# dock unread count
# inbox only = 1
# all mailboxes = 2
defaults write com.apple.mail MailDockBadge -int 1

# new message notifications
# inbox only = 1
# vips = 2
# contacts = 3
# all mailboxes = 5
defaults write com.apple.mail MailUserNotificationScope -int 1

# downloads folder
# TODO

# remove unedited downloads
# each attachment that is opened gets "downloaded" (pop3 and imap)
# files are stored in "~/Library/Containers/com.apple.mail/Data/Library/Mail Downloads/"
# never = 0, false
# when mail quits = 0, true
# when respective mail gets deleted = 2147483647, true
defaults write com.apple.mail DeleteAttachmentsAfterHours -int 0
defaults write com.apple.mail DeleteAttachmentsEnabled -bool true

# follow up suggestions
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" DisableFollowUp -bool true

# archive or delete muted messages
defaults write com.apple.mail ArchiveOrDeleteMutedMessagesKey -bool false

# automatically try sending later if outgoing server for sending is unavailable
defaults write com.apple.mail SuppressDeliveryFailure -bool false

# prefer opening messages in split view when in full screen
defaults write com.apple.mail FullScreenPreferSplit -bool true

# when searching all mailboxes, include results from:
# trash
defaults write com.apple.mail IndexTrash -bool true
# junk
defaults write com.apple.mail IndexJunk -bool true
# encrypted messages
defaults write com.apple.mail IndexDecryptedMessages -bool true


### accounts


### junk mail

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

# list preview
# none = 0
# x lines = x
defaults write com.apple.mail NumberOfSnippetLines -int 0

# move discarded messages into
# trash = 0
# archive = 1
defaults write com.apple.mail SwipeAction -int 0

# show message headers
# TODO

# display unread messages with bold font
defaults write com.apple.mail ShouldShowUnreadMessagesInBold -bool true

# use smart addresses
# use = 4
# don't use = 3
defaults write com.apple.mail-shared AddressDisplayMode -int 4

# use dark backgrounds for messages
defaults write com.apple.mail ViewMessagesWithDarkBackgrounds -bool true

# highlight messages with color when not grouped
defaults write com.apple.mail HighlightCurrentThread -bool true
# defaults write com.apple.mail ThreadBackgroundColor -int 477638

# include related messages
defaults write com.apple.mail ConversationViewSpansMailboxes -bool true

# mark all messages as read when opening a conversation
defaults write com.apple.mail ConversationViewMarkAllAsRead -bool false

# show most recent message at the top
defaults write com.apple.mail ConversationViewSortDescending -bool true


### composing

# message format
# rich text = MIME
# plain text = Plain
defaults write com.apple.mail SendFormat -string MIME

# check spelling
# as i type = InlineSpellCheckingEnabled
# when i click send = SpellCheckingOnSendEnabled
# never = NoSpellCheckingEnabled
defaults write com.apple.mail SpellCheckingBehavior -string InlineSpellCheckingEnabled

# automatically
# cc:
defaults write com.apple.mail ReplyToSelf -bool false
# bcc:
defaults write com.apple.mail BccSelf -bool false
# myself

# when sending to a group, show all member addresses
defaults write com.apple.mail-shared ExpandPrivateAliases -bool true

# mark addresses not ending with
defaults write com.apple.mail-shared AlertForNonmatchingDomains -bool false
# defaults write com.apple.mail-shared DomainForMatching -array-add "@gmail.com"

# send new messages from
# defaults write com.apple.mail-shared NewMessageFromAddress ""

# undo send delay
# time in seconds = value
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" UndoSendDelayTime -int 10

# use the same message format as the original message
defaults write com.apple.mail AutoReplyFormat -bool false

# quote the text of the original message
defaults write com.apple.mail ReplyQuotesOriginal -bool true

# increase quote level
# enabled = false
# disabled = true
defaults write com.apple.mail SupressQuoteBarsInComposeWindows -bool false

# when quoting text in replies or forwards:
# include all of the original message text = true
# include selected text, if any; otherwise include all text = false
defaults write com.apple.mail AlwaysIncludeOriginalMessage -bool true


### signatures

# place signature above quoted text
defaults write com.apple.mail SignaturePlacedAboveQuotedText -bool true

# always match my default message font
# for enabling set SignatureIsRich -bool true in
# ~/Library/Mail/V*/MailData/Signatures/AllSignatures.plist
# ~/Library/Mail/V*/MailData/Signatures/SignaturesByAccount.plist 


### rules

# to migrate rules to a new mac, follow these steps:
# quit apple mail
# go to /Users/$USER/Library/Mail/VX/MailData/ (X = 10 for ventura, 11 for sonoma, etc.) in your backup
# copy RulesActiveState.plist, SyncedRules.plist, UnsyncedRules.plist to the corresponding folder in your target system
# TODO: automate this


### extensions


### privacy

# mail privacy protection
# protect mail activity on = 1
# protect mail activity off; hide ip address on; block all remote content off = 9
# protect mail activity off; hide ip address on; block all remote content on = 11
# protect mail activity off; hide ip address off; block all remote content off = 13
# protect mail activity off; hide ip address off; block all remote content on = 15
defaults write ""$HOME"/Library/Group Containers/group.com.apple.mail/Library/Preferences/group.com.apple.mail.plist" LoadRemoteContent-v2 -int 1


### view settings

# show/hide tab bar
defaults write com.apple.mail "NSWindowTabbingShoudShowTabBarKey-MouseTrackingWindow-MessageViewer-(null)-VT-FS" -bool false

# use column layout
defaults write com.apple.mail BottomPreview -bool true
defaults write com.apple.mail ColumnLayoutMessageList -bool true

# show bottom/side preview
defaults write com.apple.mail BottomPreview -bool false

# show date and time
defaults write com.apple.mail MessageListShowDateTime -bool true

# show to/cc label
defaults write com.apple.mail EnableToCcInMessageList -bool false

# show message size
defaults write com.apple.mail MessageListShowSize -bool false

# show contact photo
defaults write com.apple.mail EnableContactPhotos -bool false

# highlight conversations
defaults write com.apple.mail HighlightClosedThreads -bool false

# cc address field
defaults write com.apple.mail ShowCcHeader -bool true

# bcc address field
defaults write com.apple.mail ShowBccHeader -bool true

# reply-to address field
defaults write com.apple.mail ShowReplyToHeader -bool false

# show/hide sidebar
# TODO

# show/hide toolbar
# TODO

# show/hide favorites bar
# TODO


### hidden mail tweaks

# settings that are commented out couldn't be validated to see if they were out of date or not

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