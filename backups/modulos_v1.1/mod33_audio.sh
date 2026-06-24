#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[33] ÁUDIO"
echo "-----------"

echo "Propriedades de áudio:"

getprop | grep -i audio | head -30

echo
echo "Volume do sistema:"
settings get system volume_music 2>/dev/null || echo "Indisponível"
