#!/bin/zsh
# Homebrew: 未導入なら公式インストール後に brew bundle（apply 済みなので ~/.Brewfile が使える）
if [ "$(uname)" != "Darwin" ]; then
	exit 0
fi

if [ ! -f /opt/homebrew/bin/brew ]; then
	echo "[chezmoi] Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" >/dev/null
	eval "$(/opt/homebrew/bin/brew shellenv)"
	if [ -f "${HOME}/.Brewfile" ]; then
		brew bundle --file "${HOME}/.Brewfile"
	elif [ -f "${HOME}/.local/share/chezmoi/dot_Brewfile" ]; then
		brew bundle --file "${HOME}/.local/share/chezmoi/dot_Brewfile"
	fi
else
	echo "[chezmoi] Homebrew already installed."
fi
