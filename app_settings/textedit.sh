#!/bin/zsh

echo "TextEdit settings..."

# osascript <<EOF
#   try
#     tell application "TextEdit"
#       run
#       delay 3
#       quit
#     end tell
#   end try		
# EOF

### new document

# format
# rich text
# defaults delete com.apple.TextEdit RichText
# plain text
defaults write com.apple.TextEdit RichText -int 0
# wrap to page
defaults write com.apple.TextEdit ShowPageBreaks -bool false

# window size
defaults write com.apple.TextEdit HeightInChars -int 40
defaults write com.apple.TextEdit WidthInChars -int 96

# font
# plain text font
defaults write com.apple.TextEdit NSFixedPitchFont -string Menlo-Regular
defaults write com.apple.TextEdit NSFixedPitchFontSize -int 14
# rich text font
defaults write com.apple.TextEdit NSFont -string Helvetica
defaults write com.apple.TextEdit NSFontSize -int 12

# properties
# defaults write com.apple.TextEdit author -string ""
# defaults write com.apple.TextEdit company -string ""

# options
# check spelling as you type
defaults write com.apple.TextEdit CheckSpellingWhileTyping -bool false 
# check grammar with spelling
defaults write com.apple.TextEdit CheckGrammarWithSpelling -bool false
# correct spelling automatically
defaults write com.apple.TextEdit CorrectSpellingAutomatically -bool false
# show ruler
defaults write com.apple.TextEdit ShowRuler -bool false
# data detectors
defaults write com.apple.TextEdit DataDetectors -bool false
# smart quotes and dashes in rich text documents only
defaults write com.apple.TextEdit SmartSubstitutionsEnabledInRichTextOnly -bool true
# check and correct spelling in rich text documents only
defaults write com.apple.TextEdit CheckSpellingAsYouTypeEnabledInRichTextOnly -bool false
# smart copy/paste
defaults write com.apple.TextEdit SmartCopyPaste -bool true
# smart quotes
defaults write com.apple.TextEdit SmartQuotes -bool false
# smart dashes
defaults write com.apple.TextEdit SmartDashes -bool false
# smart links
defaults write com.apple.TextEdit SmartLinks -bool false
# text replacement
defaults write com.apple.TextEdit TextReplacement -bool true


### open and save

# when opening a file
# display html files as html code instead of formatted text
defaults write com.apple.TextEdit IgnoreHTML -bool true
# display html files as html code instead of formatted text
defaults write com.apple.TextEdit IgnoreRichText -bool false

# when saving a file
# add ".txt" extension to plain text files
defaults write com.apple.TextEdit AddExtensionToNewPlainTextFiles -bool true

# plain text file encoding
# automatic
defaults delete com.apple.TextEdit PlainTextEncoding
defaults delete com.apple.TextEdit PlainTextEncodingForWrite
# utf-8
# defaults delete com.apple.TextEdit PlainTextEncoding -int 4
# defaults delete com.apple.TextEdit PlainTextEncodingForWrite -int 4

# html saving options

# document type
# html 4.01 strict = false, false
# html 4.01 transitional = false, true
# xhtml 1.0 strict = true, false
# xhtml 1.0 transitional = true, false
defaults write com.apple.TextEdit UseXHTMLDocType -bool false
defaults write com.apple.TextEdit UseTransitionalDocType -bool false

# styling
# embedded css = true, false
# inline css = false, true
# no css = false, false
defaults write com.apple.TextEdit UseEmbeddedCSS -bool true
defaults write com.apple.TextEdit UseInlineCSS -bool false

# encoding
# utf-8 = 4
# uff-16 = 10
# ...
defaults write com.apple.TextEdit HTMLEncoding -int 4

# preserve white space
defaults write com.apple.TextEdit PreserveWhitespace -bool true