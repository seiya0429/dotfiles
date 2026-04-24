# Do everything.
all: init apply brew

# Set initial preference.
init:
	./init.sh

# Apply chezmoi-managed dotfiles (~/.local/share/chezmoi source).
apply:
	chezmoi apply

# Backwards-compatible alias.
link: apply

brew:
	./brew.sh

# macOS 初期設定（defaults 等）と claude-work 同期は `chezmoi apply` 内の run_onchange_* による。
