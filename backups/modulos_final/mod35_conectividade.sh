#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[35] CONECTIVIDADE"
echo "------------------"

echo "Wi-Fi:"
getprop | grep -i wlan | head -10

echo
echo "Bluetooth:"
getprop | grep -i bluetooth | head -10

echo
echo "USB:"
getprop sys.usb.state

echo
echo "DNS:"
getprop | grep dns

echo
echo "Interfaces:"

if command -v ip >/dev/null 2>&1
then
    ip -brief addr
else
    echo "iproute2 não instalado"
fi
