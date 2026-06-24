#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[11] BATERIA"
echo "------------"

echo "Nível:"
termux-battery-status 2>/dev/null | grep percentage || echo "Indisponível"

echo
echo "Status:"
termux-battery-status 2>/dev/null | grep status || echo "Indisponível"

echo
echo "Temperatura:"
termux-battery-status 2>/dev/null | grep temperature || echo "Indisponível"
