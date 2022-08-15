#!/bin/bash

echo "—————————————————————————————Atualizando o sistema——————————————————————————————"

sudo dnf upgrade -y

echo "———————————————————————————————Sistema atualizado———————————————————————————————"

echo "—————————————————————————————Instalando programas———————————————————————————————"

sudo dnf install nodejs gnome-tweaks zsh fzf powerline-fonts snapd fira-code-fonts ifuse make wget gimp neovim -y

echo "—————————————————————————————Programas instalados———————————————————————————————"

echo "—————————————————————————Instalando programas em snap———————————————————————————"

sudo snap install authy spotify

echo "—————————————————————————Programas em snap instalados———————————————————————————"

git clone https://github.com/yeyushengfan258/Reversal-icon-theme.git;
git clone https://github.com/vinceliuice/Vimix-cursors.git;
