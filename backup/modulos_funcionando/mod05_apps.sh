#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[05] APLICATIVOS INSTALADOS"
echo "---------------------------"

LISTA=""

# Método 1
LISTA=$(pm list packages 2>/dev/null)

# Método 2
if [ -z "$LISTA" ]; then
    LISTA=$(cmd package list packages 2>/dev/null)
fi

# Método 3
if [ -z "$LISTA" ]; then
    LISTA=$(cmd package list packages -f 2>/dev/null)
fi

# Método 4
if [ -z "$LISTA" ]; then
    LISTA=$(find /data/app -name "*.apk" 2>/dev/null)
fi

# Sem acesso
if [ -z "$LISTA" ]; then
    echo "[INFO] Não foi possível obter a lista de aplicativos."
    echo "[INFO] O Android bloqueou o acesso neste dispositivo."
    exit 0
fi

TOTAL=$(echo "$LISTA" | wc -l)

echo "Aplicativos encontrados: $TOTAL"

echo
echo "Primeiros aplicativos encontrados:"
echo "$LISTA" | head -10
