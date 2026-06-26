#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[01] USB E DEPURAÇÃO"
echo "--------------------"

ADB=$(settings get global adb_enabled 2>/dev/null)

if [ "$ADB" = "1" ]; then
    echo "[ALERTA] Depuração USB ativada"
else
    echo "[OK] Depuração USB desativada"
fi

echo
echo "Configuração USB atual:"

USB=$(getprop sys.usb.config 2>/dev/null)

if [ -n "$USB" ]; then
    echo "$USB"
else
    echo "Não disponível"
fi

echo
echo "Estado USB:"

getprop | grep -i usb | head -15

echo
echo "Modo padrão USB:"

getprop persist.sys.usb.config 2>/dev/null
