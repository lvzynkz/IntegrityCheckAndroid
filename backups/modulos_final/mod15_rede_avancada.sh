#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[15] REDE AVANÇADA"
echo "------------------"

echo "Modelo:"
getprop ro.product.model

echo
echo "Operadora:"
getprop gsm.operator.alpha

echo
echo "Android:"
getprop ro.build.version.release

echo
echo "Hostname:"
getprop net.hostname

echo
echo "DNS configurados:"
getprop | grep dns

echo
echo "Interfaces de rede:"

if command -v ip >/dev/null 2>&1; then
    ip -brief addr
else
    echo "Pacote iproute2 não instalado"
fi
