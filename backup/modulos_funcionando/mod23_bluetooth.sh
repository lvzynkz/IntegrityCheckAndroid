#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[23] BLUETOOTH"
echo "---------------"

echo "Status Bluetooth:"
getprop | grep -i bluetooth | head -20

echo
echo "Dispositivos pareados:"
cmd bluetooth_manager get-state 2>/dev/null || echo "Informação não disponível"

echo
echo "Hardware Bluetooth:"
getprop ro.boot.btmacaddr 2>/dev/null || echo "Não disponível"
