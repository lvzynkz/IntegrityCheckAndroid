#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[34] SENSORES AVANÇADOS"
echo "------------------------"

echo "Hardware:"
getprop ro.hardware

echo
echo "Sensor Hub:"
getprop | grep -i sensor | head -30

echo
echo "Arquitetura:"
getprop ro.product.cpu.abi

echo
echo "Fabricante:"
getprop ro.product.manufacturer

echo
echo "Modelo:"
getprop ro.product.model
