#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[31] TELA"
echo "----------"

echo "Resolução:"
wm size 2>/dev/null

echo
echo "Densidade:"
wm density 2>/dev/null

echo
echo "Modelo:"
getprop ro.product.model

echo
echo "Orientação:"
settings get system accelerometer_rotation 2>/dev/null || echo "Indisponível"
