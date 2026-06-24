#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[06] ARMAZENAMENTO"
echo "------------------"

df -h /data 2>/dev/null || df -h

echo
echo "Memória interna disponível:"
df -h | head
