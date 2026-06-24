#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[02] VERIFICAÇÃO DE ROOT"
echo "------------------------"

ROOT=0

if su -c id >/dev/null 2>&1; then
    echo "[ALERTA] Root funcional detectado"
    ROOT=1
fi

if [ -d "/data/adb" ]; then
    echo "[ALERTA] Estrutura Magisk detectada"
    ROOT=1
fi

if [ -d "/data/adb/ksu" ]; then
    echo "[ALERTA] KernelSU detectado"
    ROOT=1
fi

if [ "$ROOT" -eq 0 ]; then
    echo "[OK] Nenhum root funcional detectado"
fi
