#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[18] CPU AVANÇADA"
echo "-----------------"

echo "Arquitetura:"
getprop ro.product.cpu.abi

echo
echo "Processador:"
grep "Hardware" /proc/cpuinfo 2>/dev/null

echo
echo "Núcleos:"
nproc 2>/dev/null

echo
echo "Modelo:"
getprop ro.soc.model

echo
echo "Fabricante:"
getprop ro.soc.manufacturer

echo
echo "CPU Info:"
cat /proc/cpuinfo | head -20
