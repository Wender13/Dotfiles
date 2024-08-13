#!/bin/bash

echo "——————————————————————————————Configurando o Git————————————————————————————————"
# Configurando o Git
print_header "Configurando o Git"

# Solicita o nome de usuário do Git
read -p "Digite o nome de usuário do Git: " git_username
git config --global user.name "$git_username"

# Solicita o e-mail do Git
read -p "Digite o e-mail do Git: " git_email
git config --global user.email "$git_email"

# Configurações adicionais do Git
git config --global init.defaultBranch main
git config --global color.ui auto

# Exibe as configurações para confirmação
git config --get user.name
git config --get user.email

# Gera a chave SSH usando o e-mail fornecido
ssh-keygen -C "$git_email"

# Exibe a chave pública gerada
cat ~/.ssh/id_rsa.pub
echo "———————————————————————————————Git configurado——————————————————————————————————"

echo "@reboot bash $HOME/Dotfiles/ConfigurarPt02.sh" | crontab -

echo "——————————————————————————————Configurando o ZSH————————————————————————————————"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

read -p "Deseja reiniciar o sistema agora? (s/n): " confirm && [[ $confirm == [sS] ]] && sudo reboot
