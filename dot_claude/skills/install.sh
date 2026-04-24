#!/bin/zsh
# mizchi/chezmoi-dotfiles 型: apply 後に必要な skills 用 symlink を追記する
# 例: 外部の Cursor skills ディレクトリへ ln -s する等
# claude ↔ claude-work の同期は run_onchange_darwin-claude-work-mirror.sh または
# 初回: chezmoi apply 後に 1 回
set -e
: "${HOME:?}"
# 追加の sync が必要なら:
# sh "${HOME}/.claude-work/..." 
true
