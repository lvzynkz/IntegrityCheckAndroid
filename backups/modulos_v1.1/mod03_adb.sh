#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[03] ADB E DEPURAÇÃO"
echo "--------------------"

ADB=$(settings get global adb_enabled 2>/dev/null)

if [ "$ADB" = "1" ]; then
    echo "[ALERTA] Depuração USB ativada"
else
    echo "[OK] Depuração USB desativada"
fi

ADB_WIFI=$(settings get global adb_wifi_enabled 2>/dev/null)

if [ "$ADB_WIFI" = "1" ]; then
    echo "[ALERTA] Depuração Wi-Fi ativada"
else
    echo "[OK] Depuração Wi-Fi desativada"
fi

echo
echo "Portas relacionadas ao ADB:"

ss -tulpn 2>/dev/null | grep -E "5555|5037" || echo "Nenhuma porta ADB encontrada"
