#!/bin/zsh
set -e

sh ./.bin/init.sh

sh ./.bin/link.sh

sh ./.bin/defaults.sh

sh ./.bin/brew.sh

sh ./.bin/github.sh

echo "Setup complete!"