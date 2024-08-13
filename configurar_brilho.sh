#!/bin/bash

# Criar o grupo "brightness"
sudo groupadd brightness

# Adicionar o usuário atual ao grupo "brightness"
sudo usermod -aG brightness $USER

# Atribuir permissões de escrita ao grupo no arquivo de brilho
sudo chown :brightness /sys/class/backlight/intel_backlight/brightness
sudo chmod 664 /sys/class/backlight/intel_backlight/brightness

# Adicionar a regra udev para ajustar as permissões do arquivo de brilho durante a inicialização
echo 'SUBSYSTEM=="backlight", ACTION=="add", RUN+="/bin/chgrp brightness /sys/class/backlight/%k/brightness"' | sudo tee /etc/udev/rules.d/brightness.rules >/dev/null

# Recarregar as regras udev para que a nova regra seja aplicada
sudo udevadm control --reload-rules

echo "Configuração concluída. As permissões do arquivo de brilho foram configuradas automaticamente. Reiniciando o dispositivo."

reboot
