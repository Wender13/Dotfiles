#!/bin/bash

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

mv -f $HOME/Dotfiles/.zshrc $HOME/.zshrc

sudo mv -f $HOME/Dotfiles/changeWallpaper /bin/
sudo chmod +x /bin/changeWallpaper  # Garantir que o arquivo seja executável
sudo chmod +x $HOME/Dotfiles/configurar_brilho.sh
sudo chmod +x $HOME/Dotfiles/touchpad.sh

# Ativar touchpad.sh
bash $HOME/Dotfiles/touchpad.sh

# Ativar configurar_brilho.sh
bash $HOME/Dotfiles/configurar_brilho.sh
