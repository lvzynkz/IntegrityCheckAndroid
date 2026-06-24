#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[20] SEGURANÇA DO SISTEMA"
echo "-------------------------"

if [ -f /sys/fs/selinux/enforce ]; then
    cat /sys/fs/selinux/enforce
else
    echo "Indisponível"
fi
echo
echo "Estado Verified Boot:"
getprop ro.boot.verifiedbootstate

echo
echo "Bootloader:"
getprop ro.boot.flash.locked

echo
echo "Build Tags:"
getprop ro.build.tags

echo
echo "ADB:"

ADB_STATUS=$(getprop persist.sys.usb.config 2>/dev/null)
if echo "$ADB_STATUS" | grep -qi adb; then
    echo "Ativado"
else
    echo "Desativado"
fi
echo
echo "Root:"
if su -c id >/dev/null 2>&1; then
    echo "Detectado"
else
    echo "Não detectado"
fi
