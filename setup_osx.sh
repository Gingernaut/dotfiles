#!/usr/bin/env bash
set -ex

# sudo softwareupdate -ia --verbose

# # Menu bar: hide the Time Machine, Volume, and User icons
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
#     defaults write "${domain}" dontAutoLoad -array \
#         "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
#         "/System/Library/CoreServices/Menu Extras/Volume.menu" \
#         "/System/Library/CoreServices/Menu Extras/User.menu"
# done
# defaults write com.apple.systemuiserver menuExtras -array \
#     "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
#     "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
#     "/System/Library/CoreServices/Menu Extras/Battery.menu" \
#     "/System/Library/CoreServices/Menu Extras/Clock.menu"


# # Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# # Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# # Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


# # Automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# # Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user


# sudo systemsetup -setrestartfreeze on
# sudo systemsetup -setcomputersleep Off > /dev/null
# sudo systemsetup -setcomputersleep 60
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# defaults write com.apple.screencapture type -string "png"

# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true


# # Finder: show hidden files by default
# defaults write com.apple.finder AppleShowAllFiles -bool true

# # Finder: show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


# # Avoid creating .DS_Store files on network volumes
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true


# # Disable the warning before emptying the Trash
# defaults write com.apple.finder WarnOnEmptyTrash -bool false



# # Privacy: don’t send search queries to Apple
# defaults write com.apple.Safari UniversalSearchEnabled -bool false
# defaults write com.apple.Safari SuppressSearchSuggestions -bool true


# # Show the full URL in the address bar (note: this still hides the scheme)
# defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true


# # Set Safari’s home page to `about:blank` for faster loading
# defaults write com.apple.Safari HomePage -string "about:blank"

# # Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# # Enable the Develop menu and the Web Inspector in Safari
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


# # Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4



# # Allow installing user scripts via GitHub Gist or Userscripts.org
# defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
# defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"


# ###### Homebrew

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew tap AdoptOpenJDK/openjdk

brew cask install adoptopenjdk8
brew install zsh python python3 bash moreutils findutils gnu-sed wget docker scala apache-spark nvm diff-so-fancy nmap htop
brew upgrade
