#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[29] RESUMO DE SEGURANÇA"
echo "------------------------"

PONTOS=100

ROOT=$(getprop ro.boot.verifiedbootstate)

if [ "$ROOT" != "green" ]; then
    PONTOS=$((PONTOS-20))
fi

ADB=$(getprop persist.sys.usb.config)

if echo "$ADB" | grep -qi adb
then
    PONTOS=$((PONTOS-10))
fi

echo "Pontuação: $PONTOS/100"

echo

if [ "$PONTOS" -ge 90 ]
then
    echo "[OK] Segurança Alta"
elif [ "$PONTOS" -ge 70 ]
then
    echo "[ALERTA] Segurança Média"
else
    echo "[CRÍTICO] Segurança Baixa"
fi

echo
echo "Verified Boot:"
getprop ro.boot.verifiedbootstate

echo
echo "ADB:"
echo "$ADB"
