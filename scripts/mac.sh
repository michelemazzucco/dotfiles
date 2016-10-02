#!/bin/bash
# -----------------------------------------------
# Start
# -----------------------------------------------

# Ask admin password
sudo -v

# Keep it alive
while true; do
  sudo -n true; sleep 60; kill -0 "$$" || exit;
done 2>/dev/null &

# Kill system preferences
osascript -e "tell application \"System Preferences\" to quit"

# Xcode Command Line Tools
xcode-select --install

# -----------------------------------------------
# UI/UX
# -----------------------------------------------

# Dark dock and status bar
defaults write NSGlobalDomain AppleInterfaceStyle Dark; killall Dock

# Remove animation on opening dock icon
defaults write com.apple.dock launchanim -bool false

# Show and hide the dock
defaults write com.apple.dock autohide -bool true

# Set 'scale' effects when minimize window
defaults write com.apple.dock mineffect -string "scale"


# -----------------------------------------------
# Trackpad & mouse
# -----------------------------------------------

# Enable tap to click on trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# -----------------------------------------------
# Keyboard
# -----------------------------------------------

# Increase cursor speed
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# -----------------------------------------------
# Finder
# -----------------------------------------------

# Show item info on Desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Info on the right on Desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Snap to grid on Desktop and other views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set icon size to 44x44 on Desktop and other views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 44" ~/Library/Preferences/com.apple.finder.plist

# Show Hard Drive icons on Desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true


# -----------------------------------------------
# Safari & inspector
# -----------------------------------------------

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# -----------------------------------------------
# Security & privacy
# -----------------------------------------------

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0


# -----------------------------------------------
# Sketch
# -----------------------------------------------

# Force Sketch to stop version control
defaults write -app Sketch ApplePersistence -bool no

# -----------------------------------------------
# Torrent
# -----------------------------------------------
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# -----------------------------------------------
# Kill apps
# -----------------------------------------------

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" "iTerm" \
	"Transmission" "Tweetbot" "Twitter" "iCal" "Sketch"; do
	killall "${app}" &> /dev/null
done

echo "Done! Some of these changes require a restart to take effect."
