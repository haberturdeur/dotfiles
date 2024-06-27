#!/bin/bash

mkdir -p "$HOME/.config/shell/zsh"
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/zsh/zinit.zsh" "$HOME/.config/shell/zsh"
ln -sf "$PWD/zsh/p10k.zsh" "$HOME/.config/shell/zsh"
ln -sf "$PWD/.zshrc" "$HOME"
ln -sf "$PWD/.gitconfig" "$HOME"
ln -sf "$PWD/init.vim" "$HOME/.config/nvim"
ln -sf "$PWD/alacritty/" "$HOME/.config"
ln -sf "$PWD/picom/" "$HOME/.config"
