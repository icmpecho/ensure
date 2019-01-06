echo "Enabling three fingers drag..."
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
echo "Enabling app expose"
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
echo "You might need to login again in order for these settings to take effect"
