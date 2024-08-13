#!/bin/bash

echo "—————————————————————————————Atualizando o sistema——————————————————————————————"
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y
echo "———————————————————————————————Sistema atualizado———————————————————————————————"

echo "—————————————————————————————Instalando programas———————————————————————————————"
sudo apt install -y nodejs gnome-tweaks zsh fzf fonts-powerline snapd ifuse make wget gimp flatpak ubuntu-restricted-extras gnome-software-plugin-flatpak vlc light tilix default-jdk openjdk-17-jdk maven telegram-desktop obs-studio timeshift postman bat wget curl
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install -y speedtest

# Adicionando repositório do Spotify e instalando cliente
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install -y spotify-client

echo "—————————————————————————————Programas instalados———————————————————————————————"

echo "——————————————————————————Baixando e instalando arquivos .deb——————————————————————————"

# Lista de URLs para os arquivos .deb
deb_urls=(
    "https://example.com/file1.deb"
    "https://example.com/file2.deb"
    # Adicione mais URLs conforme necessário
)

# Diretório temporário para armazenar os arquivos .deb baixados
temp_dir=$(mktemp -d)

# Função para limpar o diretório temporário ao sair
cleanup() {
    rm -rf "$temp_dir"
}
trap cleanup EXIT

# Baixa e instala cada arquivo .deb
for url in "${deb_urls[@]}"; do
    # Extrai o nome do arquivo do URL
    file_name=$(basename "$url")
    
    # Caminho completo para salvar o arquivo .deb
    deb_file="$temp_dir/$file_name"
    
    # Baixa o arquivo .deb
    wget -O "$deb_file" "$url"
    
    # Verifica se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        # Instala o arquivo .deb
        sudo dpkg -i "$deb_file"
        
        # Verifica se a instalação foi bem-sucedida
        if [ $? -ne 0 ]; then
            echo "Erro ao instalar $file_name. Tentando corrigir dependências."
            sudo apt-get install -f -y
        fi
    else
        echo "Erro ao baixar $file_name."
    fi
done

echo "——————————————————————————Arquivos .deb instalados—————————————————————————————"

echo "——————————————————————————Instalando temas e ícones—————————————————————————————"

# Verifica se o diretório ~/Downloads existe
if [ -d "$HOME/Downloads" ]; then
    cd "$HOME/Downloads"
else
    echo "Diretório ~/Downloads não encontrado."
    exit 1
fi

git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
git clone https://github.com/vinceliuice/Graphite-cursors.git
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git

cd Graphite-gtk-theme
sudo ./install.sh -g

cd ../Graphite-cursors/
./install.sh

cd ../Tela-circle-icon-theme/
./install.sh blue

cd ../Graphite-gtk-theme/
sudo ./install.sh

echo "——————————————————————————Temas e ícones instalados—————————————————————————————"

echo "——————————————————————————Configurando alternativas—————————————————————————————"

sudo update-alternatives --config java
sudo update-alternatives --config x-terminal-emulator

echo "——————————————————————————Alternativas configuradas—————————————————————————————"

# Acionando o script "ProgramasEmSnap.sh" após reiniciar
echo "@reboot bash $HOME/Dotfiles/ProgramasEmSnap.sh" | crontab -

read -p "Deseja reiniciar o sistema agora? (s/n): " confirm && [[ $confirm == [sS] ]] && sudo reboot
