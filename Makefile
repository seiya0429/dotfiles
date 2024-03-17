# Do everything.
all: init link brew defaults

# Set initial preference.
init:
	./init.sh

# Link dotfiles.
link:
	./link.sh

brew:
	./brew.sh

# Set macOS system preferences.
defaults:
	./defaults.sh