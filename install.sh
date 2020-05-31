#!/usr/bin/env bash

# Install ZSH
sudo yum update && sudo yum -y install zsh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Copy over dotfiles
rsync --exclude ".git/"      \
		  --exclude ".DS_Store"  \
		  --exclude "install.sh" \
		  --exclude ".Renviron"  \
		  --exclude "README.md"  \
		  -avh --no-perms . ~;
