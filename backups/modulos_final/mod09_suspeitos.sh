#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[09] PROCESSOS SUSPEITOS"
echo "------------------------"

SUSPEITOS="frida gameguardian xposed lspatch lucky"

ACHOU=0

for item in $SUSPEITOS
do
    if ps -A 2>/dev/null | grep -i "$item" | grep -v grep >/dev/null
    then
        echo "[ALERTA] Encontrado: $item"
        ACHOU=1
    fi
done

if [ "$ACHOU" -eq 0 ]; then
    echo "[OK] Nenhum processo suspeito encontrado"
fi
