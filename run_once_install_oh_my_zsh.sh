#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Getting Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc --skip-chsh
    echo "✅️ Oh My Zsh has been successfully installed"
else
    echo "✅️ Oh My Zsh is already installed"
fi
