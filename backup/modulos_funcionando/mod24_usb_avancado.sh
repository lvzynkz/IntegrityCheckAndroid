#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[24] USB AVANÇADO"
echo "------------------"

echo "Configuração USB:"
getprop persist.sys.usb.config

echo
echo "Estado USB:"
getprop sys.usb.state

echo
echo "Funções USB:"
getprop sys.usb.config

echo
echo "ADB USB:"
if getprop persist.sys.usb.config | grep -qi adb
then
    echo "Ativado"
else
    echo "Desativado"
fi
