#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[19] ARMAZENAMENTO AVANÇADO"
echo "---------------------------"

echo "Partições montadas:"
df -h

echo
echo "Memória interna:"

df -h /data 2>/dev/null

echo
echo "Diretório HOME:"

du -sh $HOME 2>/dev/null

echo
echo "Espaço livre:"

df -h | awk 'NR==1 || /\/data|\/storage|\/sdcard/'
