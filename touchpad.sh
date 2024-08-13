#!/bin/bash

# Definindo o conteúdo do script toggle_touchpad.sh
TOGGLE_TOUCHPAD_CONTENT='#!/bin/bash

# Try to auto-detect touchpad ID if not set
if [ -z "$DEVICE" ]; then
    DEVICE=$(xinput list | grep -i "touchpad" | awk -F"=" '"'"'{print $2}'"'"' | awk '"'"'{print $1}'"'"')
fi

# Check if DEVICE is still empty
if [ -z "$DEVICE" ]; then
    echo "Unable to detect touchpad device. Please set DEVICE manually."
    exit 1
fi

STATUS=$(xinput list-props $DEVICE | grep "Device Enabled" | awk '"'"'{print $4}'"'"')

if [ "$STATUS" == "1" ]; then
    xinput disable $DEVICE
else
    xinput enable $DEVICE
fi'

# Criando o arquivo toggle_touchpad.sh e adicionando o conteúdo
echo "$TOGGLE_TOUCHPAD_CONTENT" > toggle_touchpad.sh

# Dando permissões de execução para o script
chmod +x toggle_touchpad.sh

# Movendo o script para a pasta /bin/
sudo mv toggle_touchpad.sh /bin/

echo "Script toggle_touchpad.sh criado e movido para /bin/ com permissões de execução."

