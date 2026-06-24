#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[02] VERIFICAÇÃO DE ROOT"
echo "------------------------"

ROOT=0

if command -v su >/dev/null 2>&1; then
    echo "[!] Binário 'su' encontrado"
    ROOT=1
fi

for caminho in \
/system/bin/su \
/system/xbin/su \
/sbin/su \
/system/bin/.ext/.su
do
    if [ -e "$caminho" ]; then
        echo "[!] Encontrado: $caminho"
        ROOT=1
    fi
done

if [ -d "/data/adb" ]; then
    echo "[!] Estrutura Magisk detectada"
    ROOT=1
fi

if [ "$ROOT" -eq 0 ]; then
    echo "[OK] Nenhum indício de root encontrado"
else
    echo "[ALERTA] Possível root detectado"
fi
