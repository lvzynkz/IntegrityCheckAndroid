#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[14] RELATÓRIO GERAL"
echo "--------------------"

echo "Data: $(date)"

echo
echo "Modelo:"
getprop ro.product.model

echo
echo "Android:"
getprop ro.build.version.release

echo
echo "Usuário:"
whoami 2>/dev/null || echo "termux"

echo
echo "Status final: Verificação concluída"
