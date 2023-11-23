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

# format (default: rich text)
# rich text
# defaults delete com.apple.TextEdit RichText
# plain text
defaults write com.apple.TextEdit RichText -int 0
# wrap to page
defaults write com.apple.TextEdit ShowPageBreaks -bool false

# window size (default: 96, 30)
defaults write com.apple.TextEdit WidthInChars -int 96
defaults write com.apple.TextEdit HeightInChars -int 40

# font
# plain text font (default: Menlo Regular 11)
defaults write com.apple.TextEdit NSFixedPitchFont -string Menlo-Regular
defaults write com.apple.TextEdit NSFixedPitchFontSize -int 14
# rich text font (default: Helvetica 12)
defaults write com.apple.TextEdit NSFont -string Helvetica
defaults write com.apple.TextEdit NSFontSize -int 12

# properties (default: none)
# defaults write com.apple.TextEdit author -string ""
# defaults write com.apple.TextEdit company -string ""

# options
# check spelling as you type (default: on)
defaults write com.apple.TextEdit CheckSpellingWhileTyping -bool false 
# check grammar with spelling (default: off)
defaults write com.apple.TextEdit CheckGrammarWithSpelling -bool false
# correct spelling automatically (default: off)
defaults write com.apple.TextEdit CorrectSpellingAutomatically -bool false
# show ruler (default: on)
defaults write com.apple.TextEdit ShowRuler -bool false
# data detectors (default: off)
defaults write com.apple.TextEdit DataDetectors -bool false
# smart quotes and dashes in rich text documents only (default: on)
defaults write com.apple.TextEdit SmartSubstitutionsEnabledInRichTextOnly -bool true
# check and correct spelling in rich text documents only (default: off)
defaults write com.apple.TextEdit CheckSpellingAsYouTypeEnabledInRichTextOnly -bool false
# smart copy/paste (default: on)
defaults write com.apple.TextEdit SmartCopyPaste -bool true
# smart quotes (default: off)
defaults write com.apple.TextEdit SmartQuotes -bool false
# smart dashes (default: off)
defaults write com.apple.TextEdit SmartDashes -bool false
# smart links (default: off)
defaults write com.apple.TextEdit SmartLinks -bool false
# text replacement (default: on)
defaults write com.apple.TextEdit TextReplacement -bool true


### open and save

# when opening a file
# display html files as html code instead of formatted text (default: off)
defaults write com.apple.TextEdit IgnoreHTML -bool true
# display html files as html code instead of formatted text (default: off)
defaults write com.apple.TextEdit IgnoreRichText -bool false

# when saving a file
# add ".txt" extension to plain text files (default: on)
defaults write com.apple.TextEdit AddExtensionToNewPlainTextFiles -bool true

# plain text file encoding (default: automatic)
# automatic
defaults delete com.apple.TextEdit PlainTextEncoding
defaults delete com.apple.TextEdit PlainTextEncodingForWrite
# utf-8
# defaults delete com.apple.TextEdit PlainTextEncoding -int 4
# defaults delete com.apple.TextEdit PlainTextEncodingForWrite -int 4

# html saving options

# document type (default: html 4.01 strict)
# html 4.01 strict = false, false
# html 4.01 transitional = false, true
# xhtml 1.0 strict = true, false
# xhtml 1.0 transitional = true, false
defaults write com.apple.TextEdit UseXHTMLDocType -bool false
defaults write com.apple.TextEdit UseTransitionalDocType -bool false

# styling (default: embedded css)
# embedded css = true, false
# inline css = false, true
# no css = false, false
defaults write com.apple.TextEdit UseEmbeddedCSS -bool true
defaults write com.apple.TextEdit UseInlineCSS -bool false

# encoding (default: utf-8)
# utf-8 = 4
# uff-16 = 10
# ...
defaults write com.apple.TextEdit HTMLEncoding -int 4

# preserve white space (default: on)
defaults write com.apple.TextEdit PreserveWhitespace -bool true