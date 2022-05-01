#!/bin/bash

echo "——————————————————————————Atualizando os repositórios———————————————————————————"

sudo apt update

echo "————————————————————————————Repositórios atualizados————————————————————————————"

echo "————————————————————————————Atualizando os programas————————————————————————————"

sudo apt upgrade -s

sudo apt autoremove -s

echo "—————————————————————————————Programas atualizados——————————————————————————————"

echo "—————————————————————————————Instalando programas———————————————————————————————"

sudo apt install ubuntu-restricted-extras nodejs gimp gnome-tweaks nitrogen audacity shotcut tilix zsh fzf fonts-powerline snapd vlc rhythmbox fonts-firacode ifuse ranger tty-clock node-typescript make wget -s

echo "—————————————————————————————Programas instalados———————————————————————————————"

echo "—————————————————————————Instalando programas em snap———————————————————————————"

sudo snap install authy spotify

echo "—————————————————————————Programas em snap instalados———————————————————————————"

echo "——————————————————————————Alterando terminal padrão—————————————————————————————"

sudo update-alternatives --config x-terminal-emulator

echo "———————————————————————————Terminal padrão alterado—————————————————————————————"

echo "——————————————————————————————Instalando Pop Shell——————————————————————————————"

git clone https://github.com/pop-os/shell.git
cd shell/
sudo make local-install
cd ..

echo "——————————————————————————————Pop Shell instalado———————————————————————————————"

echo "————————————————————————————————Instalando cava—————————————————————————————————"

sudo add-apt-repository ppa:hsheth2/ppa
sudo apt update
sudo apt install cava -s

echo "—————————————————————————————————Cava instalado—————————————————————————————————"

echo "—————————————————————————————Baixando arquivos .deb—————————————————————————————"

mkdir /home/$USER/Downloads/Programas

cd /home/$USER/Downloads/Programas/

wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb?_ga=2.127600779.72058758.1651409716-1611856977.1651409716

wget -c https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "—————————————————————————————Arquivos .deb baixados—————————————————————————————"

echo "————————————————————————————Instalando arquivos .deb————————————————————————————"

sudo dpgk -i*.deb

echo "————————————————————————————Arquivos .deb instalados————————————————————————————"
