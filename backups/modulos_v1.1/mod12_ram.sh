#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[12] MEMÓRIA RAM"
echo "----------------"

if command -v free >/dev/null 2>&1; then
    free -h
else
    cat /proc/meminfo | head -10
fi
