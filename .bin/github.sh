#!/bin/zsh

# GitHub SSH Setup
echo -e "\033[0;34m- GitHub SSH Setup...\033[0m"
echo "Create SSH key"
SSH_KEY_PATH="$HOME/.ssh"
if [ ! -d "$SSH_KEY_PATH" ]; then
    mkdir "$SSH_KEY_PATH"
fi
# create SSH key
ssh-keygen -N '' -f ${SSH_KEY_PATH}/id_rsa
pbcopy < ${SSH_KEY_PATH}/id_rsa.pub

# GitHub login
echo -e "\033[0;34m- GitHub login start...\033[0m"
echo "First you need to choice SSH"
echo "Second you need to choice id_rsa.pub"

gh auth login -w
