#!/usr/bin/env zsh

if test -n "$(git -C ${DOTFILES_HOME} status --porcelain)" || ! git -C ${DOTFILES_HOME} diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[36m=== DOTFILES IS DIRTY ===\e[m" 1>&2
  echo -e "\e[33mThe dotfiles have been changed.\e[m" 1>&2
  echo -e "\e[36m=========================\e[m" 1>&2
fi