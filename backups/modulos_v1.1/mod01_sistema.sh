#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[01] INFORMAÇÕES DO SISTEMA"
echo "---------------------------"

echo "Modelo:"
getprop ro.product.model

echo
echo "Fabricante:"
getprop ro.product.manufacturer

echo
echo "Android:"
getprop ro.build.version.release

echo
echo "SDK:"
getprop ro.build.version.sdk
