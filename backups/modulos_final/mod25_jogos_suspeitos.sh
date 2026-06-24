#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[25] JOGOS SUSPEITOS"
echo "--------------------"

find /storage/emulated/0 -type f 2>/dev/null | grep -Ei \
"aimbot|esp|wallhack|modmenu|inject|cheat|hack|lua" | head -50

echo
echo "Verificação concluída."
