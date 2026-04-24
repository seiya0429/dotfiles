#!/bin/zsh

if [ ! -f /opt/homebrew/bin/brew ]
  then
    echo "Dose not exist Homebrew"
  else
    echo "brew bundle..."
    if [ -f "${HOME}/.Brewfile" ]; then
      brew bundle --file "${HOME}/.Brewfile"
    elif [ -f "${HOME}/.local/share/chezmoi/dot_Brewfile" ]; then
      brew bundle --file "${HOME}/.local/share/chezmoi/dot_Brewfile"
    else
      echo "No Brewfile in ~ or chezmoi source. Run: chezmoi init <url> && chezmoi apply" >&2
    fi
fi
