# Do everything.
all: init brew link defaults

# Set initial preference.
init:
	./init.sh

# Link dotfiles.
link:
	./link.sh

# Set macOS system preferences.
defaults:
	./defaults.sh