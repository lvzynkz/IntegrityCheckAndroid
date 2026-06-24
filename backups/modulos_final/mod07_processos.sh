#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[07] PROCESSOS ATIVOS"
echo "---------------------"

if command -v ps >/dev/null 2>&1; then

    TOTAL=$(ps -A 2>/dev/null | wc -l)

    echo "Processos encontrados: $TOTAL"

    echo
    echo "Primeiros 15 processos:"

    ps -A 2>/dev/null | head -15

else

    echo "[INFO] Comando ps indisponível"

fi
