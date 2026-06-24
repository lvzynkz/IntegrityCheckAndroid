#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[28] RELATÓRIO PREMIUM"
echo "----------------------"

echo "Modelo:"
getprop ro.product.model

echo
echo "Android:"
getprop ro.build.version.release

echo
echo "Fabricante:"
getprop ro.product.manufacturer

echo
echo "Kernel:"
uname -r

echo
echo "Data:"
date
