#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[26] APPS DE RISCO"
echo "------------------"

echo "Procurando aplicativos conhecidos..."

find /storage/emulated/0/Android/data -maxdepth 1 -type d 2>/dev/null | grep -Ei \
"gameguardian|lspatch|virtual|xposed|frida|cheat|lucky|clone|parallel|dual"

echo
echo "Análise concluída."
