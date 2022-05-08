#!/bin/bash

echo "——————————————————————————Atualizando os repositórios———————————————————————————"

sudo apt update

echo "————————————————————————————Repositórios atualizados————————————————————————————"

echo "————————————————————————————Atualizando os programas————————————————————————————"

sudo apt upgrade -y

sudo apt autoremove -y

echo "—————————————————————————————Programas atualizados——————————————————————————————"

echo "—————————————————————————————Instalando programas———————————————————————————————"

sudo apt install ubuntu-restricted-extras nodejs gimp gnome-tweaks nitrogen audacity shotcut tilix zsh fzf fonts-powerline snapd vlc rhythmbox fonts-firacode ifuse ranger tty-clock make wget neovim -y

echo "—————————————————————————————Programas instalados———————————————————————————————"

echo "—————————————————————————Instalando programas em snap———————————————————————————"

sudo snap install authy spotify

echo "—————————————————————————Programas em snap instalados———————————————————————————"

echo "——————————————————————————Alterando terminal padrão—————————————————————————————"

sudo update-alternatives --config x-terminal-emulator

echo "———————————————————————————Terminal padrão alterado—————————————————————————————"

echo "————————————————————————————————Instalando cava—————————————————————————————————"

sudo add-apt-repository ppa:hsheth2/ppa
sudo apt update
sudo apt install cava -y

echo "—————————————————————————————————Cava instalado—————————————————————————————————"

echo "—————————————————————————————Baixando arquivos .deb—————————————————————————————"

mkdir /home/$USER/Downloads/Programas

cd /home/$USER/Downloads/Programas/

wget -c https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb?_ga=2.127600779.72058758.1651409716-1611856977.1651409716

wget -c https://az764295.vo.msecnd.net/stable/dfd34e8260c270da74b5c2d86d61aee4b6d56977/code_1.66.2-1649664567_amd64.deb

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "—————————————————————————————Arquivos .deb baixados—————————————————————————————"

echo "————————————————————————————Instalando arquivos .deb————————————————————————————"

sudo dpkg -i *.deb

echo "————————————————————————————Arquivos .deb instalados————————————————————————————"

echo "————————————————————————————————Instalando temas————————————————————————————————"

cd ..

mkdir .themes

mkdir .icons

git clone https://github.com/vinceliuice/Vimix-cursors.git

cd Vimix-cursors/

sudo ./install.sh

cd ..

git clone https://github.com/bikass/kora.git

cd /home/$USER/kora/

sudo mv kora /home/$USER/.icons/

cd ..

git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git

cd /home/$USER/Tokyo-Night-GTK-Theme/themes/

sudo mv Tokyonight_Dark /home/$USER/.themes/

cd ..

echo "————————————————————————————————Temas instalados————————————————————————————————" 

echo "———————————————————————————————Instalando Bashtop———————————————————————————————" 

git clone https://github.com/aristocratos/bashtop.git
cd bashtop
sudo make install

echo "———————————————————————————————Bahstop instalado———————————————————————————————"
