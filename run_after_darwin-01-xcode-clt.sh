#!/bin/zsh
# Command Line Tools 未導入ならインストーラを起動（run_once にしない: インストール完了前に成功扱いになりうるため）
if [ "$(uname)" != "Darwin" ]; then
	exit 0
fi

if ! xcode-select --print-path &>/dev/null; then
	echo "[chezmoi] Command Line Tools が見つかりません。インストーラを起動します。完了後に再度 chezmoi apply してください。"
	xcode-select --install
fi
