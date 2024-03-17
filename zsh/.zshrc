if [[ -z "${DOTFILES_HOME}" ]]; then
  export DOTFILES_HOME=~/dotfiles
fi

export DOTFILES_ZSH_HOME=${DOTFILES_HOME}/zsh

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh settings
source ${DOTFILES_ZSH_HOME}/.zshrc.setting

# setting starship
eval "$(starship init zsh)"

# check_update_dotfiles
(source ${DOTFILES_ZSH_HOME}/.zshrc.check_update_dotfiles &) > /dev/null

# autocomplete
source ${DOTFILES_ZSH_HOME}/.zshrc.autocomplete

# path
source ${DOTFILES_ZSH_HOME}/.zshrc.path

# setting asdf
source ${DOTFILES_ZSH_HOME}/.zshrc.asdf