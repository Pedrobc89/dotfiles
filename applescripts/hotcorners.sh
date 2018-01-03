echo " Hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# Top left screen corner → Mission Control


ISENEABLED=$(defaults read com.apple.dock wvous-br-corner)

echo "$ISENEABLED"

test 0 == 0

if [ $ISENEABLED == 0 ]
then
  echo " Top left screen corner → Mission Control"
  defaults write com.apple.dock wvous-tl-corner -int 2
  defaults write com.apple.dock wvous-tl-modifier -int 0
  echo " Top right screen corner → Desktop"
  defaults write com.apple.dock wvous-tr-corner -int 4
  defaults write com.apple.dock wvous-tr-modifier -int 0
  echo " Bottom left screen corner → Show applications windows"
  defaults write com.apple.dock wvous-bl-corner -int 3
  defaults write com.apple.dock wvous-bl-modifier -int 0
  echo " Bottom right screen corner → ⌘ Put display to sleep"
  defaults write com.apple.dock wvous-br-corner -int 10
  defaults write com.apple.dock wvous-br-modifier -int 1048576
else
  echo " Top left screen corner → Disabled"
  defaults write com.apple.dock wvous-tl-corner -int 0
  defaults write com.apple.dock wvous-tl-modifier -int 0
  echo " Top right screen corner → Disabled"
  defaults write com.apple.dock wvous-tr-corner -int 0
  defaults write com.apple.dock wvous-tr-modifier -int 0
  echo " Bottom left screen corner → Disabled"
  defaults write com.apple.dock wvous-bl-corner -int 0
  defaults write com.apple.dock wvous-bl-modifier -int 0
  echo " Bottom right screen corner → Disabled"
  defaults write com.apple.dock wvous-br-corner -int 0
  defaults write com.apple.dock wvous-br-modifier -int 0
fi

killall Dock
