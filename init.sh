#!/bin/zsh

# Homebrew は chezmoi apply 内の run_once_after_darwin-homebrew.sh で扱う

# Install xcode
# Check if command line tools are installed
if ! xcode-select --print-path &> /dev/null; then
  # Install command line tools
  echo "Command line tools not found. Installing..."
  xcode-select --install
else
  echo "Command line tools are already installed."
fi
