#!/bin/bash

echo "—————————————————————————————Atualizando o sistema——————————————————————————————"

sudo dnf upgrade -y

echo "———————————————————————————————Sistema atualizado———————————————————————————————"

echo "—————————————————————————————Instalando RPM Fusion——————————————————————————————"

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "—————————————————————————————RPM Fusion instalado———————————————————————————————"

echo "—————————————————————————————Instalando programas———————————————————————————————"

sudo dnf install nodejs gnome-tweaks zsh fzf powerline-fonts snapd fira-code-fonts ifuse make wget gimp -y

echo "—————————————————————————————Programas instalados———————————————————————————————"

echo "—————————————————————————Instalando programas em snap———————————————————————————"

sudo snap install authy spotify

echo "—————————————————————————Programas em snap instalados———————————————————————————"
