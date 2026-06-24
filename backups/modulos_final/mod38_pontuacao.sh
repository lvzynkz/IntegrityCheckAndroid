#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[38] PONTUAÇÃO FINAL"
echo "--------------------"

PONTOS=100

BOOT=$(getprop ro.boot.verifiedbootstate)

if [ "$BOOT" != "green" ]; then
    PONTOS=$((PONTOS-20))
fi

if getprop persist.sys.usb.config | grep -qi adb
then
    PONTOS=$((PONTOS-10))
fi

echo "Pontuação: $PONTOS/100"
