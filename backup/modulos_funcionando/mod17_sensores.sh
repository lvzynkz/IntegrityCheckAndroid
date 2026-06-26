#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[17] SENSORES"
echo "-------------"

echo "Acelerômetro:"
getprop | grep -i accel

echo
echo "Giroscópio:"
getprop | grep -i gyro

echo
echo "Sensores detectados:"
getprop | grep -i sensor

echo
echo "Hardware:"
getprop ro.hardware
