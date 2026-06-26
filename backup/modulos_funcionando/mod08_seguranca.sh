#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[08] PONTUAÇÃO DE SEGURANÇA"
echo "---------------------------"

PONTOS=100

ADB=$(settings get global adb_enabled 2>/dev/null)

if [ "$ADB" = "1" ]; then
    echo "-10 pontos: Depuração USB ativada"
    PONTOS=$((PONTOS-10))
fi

if su -c id >/dev/null 2>&1; then
    echo "-40 pontos: Root detectado"
    PONTOS=$((PONTOS-40))
fi

if ip addr 2>/dev/null | grep -q "tun"; then
    echo "-10 pontos: VPN ativa"
    PONTOS=$((PONTOS-10))
fi

echo
echo "Pontuação: $PONTOS/100"

if [ "$PONTOS" -ge 90 ]; then
    echo "Status: EXCELENTE"
elif [ "$PONTOS" -ge 70 ]; then
    echo "Status: BOM"
elif [ "$PONTOS" -ge 50 ]; then
    echo "Status: MÉDIO"
else
    echo "Status: CRÍTICO"
fi
