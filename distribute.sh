#!/bin/bash

mkdir -p "$HOME/.config/shell/zsh"
ln -sf "$PWD/zsh/*" "$HOME/.config/shell/zsh"
ln -sf "$PWD/.zshrc" "$HOME"
ln -sf "$PWD/.gitconfig" "$HOME"
