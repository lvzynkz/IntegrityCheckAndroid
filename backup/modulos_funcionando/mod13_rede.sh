#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[13] REDE"
echo "----------"

echo "Hostname:"
getprop net.hostname 2>/dev/null

echo
echo "DNS:"
getprop | grep dns

echo
echo "Interfaces:"

if command -v ip >/dev/null 2>&1; then
    ip -brief addr 2>/dev/null
else
    echo "iproute2 não instalado"
fi
