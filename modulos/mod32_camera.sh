#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[32] CÂMERAS"
echo "-------------"

echo "Propriedades relacionadas à câmera:"

getprop | grep -i camera | head -30

echo
echo "Fabricante:"
getprop ro.product.manufacturer

echo
echo "Modelo:"
getprop ro.product.model
