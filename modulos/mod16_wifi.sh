#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[16] WI-FI AVANÇADO"
echo "-------------------"

echo "Wi-Fi ativado:"
settings get global wifi_on 2>/dev/null

echo
echo "SSID atual:"
getprop | grep -i ssid

echo
echo "DNS:"
getprop | grep dns

echo
echo "Gateway e IP:"

if command -v ip >/dev/null 2>&1; then
    ip route 2>/dev/null
    echo
    ip addr 2>/dev/null | grep "inet "
else
    echo "Pacote iproute2 não instalado"
fi

echo
echo "Interfaces sem fio encontradas:"
if command -v ip >/dev/null 2>&1; then
    ip link 2>/dev/null | grep -E "wlan|wifi"
else
    echo "Não disponível"
fi
