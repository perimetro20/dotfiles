#!/bin/sh

DOTFILES_PATH=$(pwd)

# Setup Homebrew
which -s brew
if [ $? != 0 ]
then
    # Install Homebrew
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # TODO Check homebrew was installed correctly with brew doctor
    # TODO Check this script on new mac being setup
    # TODO Add homebrew to the path
else
    brew update
fi

# Install Everythin
echo "Installing brew casks and packages"
brew bundle install

# Setup Emacs
echo "Setting up Emacs"
EMACS_CONFIG_PATH=$HOME/.emacs.d
mkdir -p $EMACS_CONFIG_PATH
ln -s $DOTFILES_PATH/settings.org $EMACS_CONFIG_PATH
ln -s $DOTFILES_PATH/init.el $EMACS_CONFIG_PATH

# Setup Karabiner
echo "Setting up Karabiner"
KARABINER_CONFIG_PATH=$HOME/.config/karabiner
mkdir -p $KARABINER_CONFIG_PATH
ln -s $DOTFILES_PATH/karabiner.json $KARABINER_CONFIG_PATH

# TODO: Create SSH Keys

# Git Setup
echo "Setup global gitignore"
ln -s $DOTFILES_PATH/global.gitignore $HOME
git config --global core.excludesfile $HOME/global.gitignore
# TODO: Setup for name email
