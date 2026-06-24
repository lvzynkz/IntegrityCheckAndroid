#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[04] VPN E REDE"
echo "----------------"

VPN=0

if ip addr 2>/dev/null | grep -q "tun"; then
    echo "[ALERTA] Interface VPN (tun) detectada"
    VPN=1
fi

if ip addr 2>/dev/null | grep -q "ppp"; then
    echo "[ALERTA] Interface PPP detectada"
    VPN=1
fi

echo
echo "Interfaces ativas:"
ip -brief addr 2>/dev/null

echo
echo "DNS configurado:"
getprop | grep dns

if [ "$VPN" -eq 0 ]; then
    echo
    echo "[OK] Nenhum túnel VPN detectado"
fi
