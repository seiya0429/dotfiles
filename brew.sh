#!/bin/zsh

if [ ! -f /opt/homebrew/bin/brew ]
  then
    echo "Dose not exist Homebrew"
  else
    echo "brew bundle..."
    brew bundle --file "~/dotfiles/homebrew/.Brewfile"
fi