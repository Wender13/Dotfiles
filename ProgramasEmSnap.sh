#!/bin/bash

echo "—————————————————————————Instalando programas em snap———————————————————————————"
sudo snap install simplenote
echo "—————————————————————————Programas em snap instalados———————————————————————————"

echo "@reboot bash $HOME/Dotfiles/ConfigurarPt01.sh" | crontab -

read -p "Deseja reiniciar o sistema agora? (s/n): " confirm && [[ $confirm == [sS] ]] && sudo reboot
