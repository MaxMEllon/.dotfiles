#!/bin/bash

set -eu

echo "#!/bin/bash"

echo "defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false"
echo "defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false"

code --list-extensions | xargs -L 1 echo code --install-extension
