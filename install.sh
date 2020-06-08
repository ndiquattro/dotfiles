#!/usr/bin/env bash

# xcode
xcode-select --install

# Install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

# General dev installs
brew install git zsh

# Setup for pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Setup R
brew cask install r rstudio
Rscript -e "install.packages(c('usethis', 'devtools'), repos = 'http://cran.us.r-project.org')"

# Other apps
brew cask install google-chrome 1password iterm2

# Copy over dotfiles
rsync --exclude ".git/"      \
		  --exclude ".DS_Store"  \
		  --exclude "install.sh" \
		  --exclude ".Renviron"  \
		  --exclude "README.md"  \
		  -avh --no-perms . ~;
