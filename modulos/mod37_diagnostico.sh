#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[37] DIAGNÓSTICO GERAL"
echo "----------------------"

echo "Boot:"
getprop ro.boot.verifiedbootstate

echo
echo "Build:"
getprop ro.build.tags

echo
echo "SELinux:"
cat /sys/fs/selinux/enforce 2>/dev/null

echo
echo "USB:"
getprop sys.usb.state

echo
echo "RAM:"
grep MemTotal /proc/meminfo
