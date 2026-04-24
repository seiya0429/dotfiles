#!/bin/zsh

# Install Homebrew
if [ ! -f /opt/homebrew/bin/brew ]
  then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
    eval "$(/opt/homebrew/bin/brew shellenv)"
    if [ -f "${HOME}/.Brewfile" ]; then
      brew bundle --file "${HOME}/.Brewfile"
    elif [ -f "${HOME}/.local/share/chezmoi/dot_Brewfile" ]; then
      brew bundle --file "${HOME}/.local/share/chezmoi/dot_Brewfile"
    fi

  else
    echo "Homebrew already installed."
fi

# Install xcode
# Check if command line tools are installed
if ! xcode-select --print-path &> /dev/null; then
  # Install command line tools
  echo "Command line tools not found. Installing..."
  xcode-select --install
else
  echo "Command line tools are already installed."
fi
