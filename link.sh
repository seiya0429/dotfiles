#!/bin/zsh

# zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile

# starship
mkdir -p ~/.config
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# karabiner
mkdir -p ~/.config/karabiner
ln -sf ~/dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

# asdf
ln -sf ~/dotfiles/asdf/.asdfrc ~/.asdfrc
ln -sf ~/dotfiles/asdf/.tool-versions ~/.tool-versions

# git
mkdir -p ~/.config/git
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/ignore ~/.config/git/ignore

# homebrew
ln -sf ~/dotfiles/homebrew/.Brewfile ~/.Brewfile

# claude
mkdir -p ~/.claude
ln -sf ~/dotfiles/claude/settings.json ~/.claude/settings.json
ln -sf ~/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sfn ~/dotfiles/claude/hooks ~/.claude/hooks
ln -sfn ~/dotfiles/claude/skills ~/.claude/skills
ln -sfn ~/dotfiles/claude/commands ~/.claude/commands

# claude (work profile; CLAUDE_CONFIG_DIR=~/.claude-work)
mkdir -p ~/.claude-work
ln -sf ~/dotfiles/claude/settings.json ~/.claude-work/settings.json
ln -sf ~/dotfiles/claude/CLAUDE.md ~/.claude-work/CLAUDE.md
ln -sfn ~/dotfiles/claude/hooks ~/.claude-work/hooks
ln -sfn ~/dotfiles/claude/skills ~/.claude-work/skills
ln -sfn ~/dotfiles/claude/commands ~/.claude-work/commands