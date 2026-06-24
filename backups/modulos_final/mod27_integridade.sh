#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[27] INTEGRIDADE DO SISTEMA"
echo "---------------------------"

echo "Build:"
getprop ro.build.display.id

echo
echo "Tags:"
getprop ro.build.tags

echo
echo "Verified Boot:"
getprop ro.boot.verifiedbootstate

echo
echo "Bootloader:"
getprop ro.boot.flash.locked

echo
echo "Tipo de build:"
getprop ro.build.type
