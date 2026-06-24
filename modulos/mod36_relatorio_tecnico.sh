#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[36] RELATÓRIO TÉCNICO"
echo "----------------------"

echo "Modelo:"
getprop ro.product.model

echo
echo "Fabricante:"
getprop ro.product.manufacturer

echo
echo "Android:"
getprop ro.build.version.release

echo
echo "Kernel:"
uname -r

echo
echo "Arquitetura:"
getprop ro.product.cpu.abi

echo
echo "Data:"
date
