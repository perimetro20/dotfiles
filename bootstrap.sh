#!/bin/sh

DOTFILES_PATH=$(pwd)

# Setup Emacs
echo "Setting up Emacs\n"
EMACS_CONFIG_PATH=$HOME/.emacs.d
mkdir -p $EMACS_CONFIG_PATH
ln -s $DOTFILES_PATH/settings.org $EMACS_CONFIG_PATH
ln -s $DOTFILES_PATH/init.el $EMACS_CONFIG_PATH

# Setup Karabiner
echo "Setting up Karabiner\n"
KARABINER_CONFIG_PATH=$HOME/.config/karabiner
mkdir -p $KARABINER_CONFIG_PATH
ln -s $DOTFILES_PATH/karabiner.json $KARABINER_CONFIG_PATH
