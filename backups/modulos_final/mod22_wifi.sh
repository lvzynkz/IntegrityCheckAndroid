#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[22] WI-FI"
echo "-----------"

echo "SSID:"
getprop | grep -i ssid

echo
echo "Interface Wi-Fi:"
getprop | grep -i wlan

echo
echo "Estado Wi-Fi:"
cmd wifi status 2>/dev/null || echo "Informação não disponível"

echo
echo "MAC Wi-Fi:"
cat /sys/class/net/wlan0/address 2>/dev/null || echo "Não disponível"
