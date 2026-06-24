#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[39] EXPORTAR RELATÓRIO"
echo "------------------------"

mkdir -p relatorios

ARQ="relatorios/relatorio_$(date +%Y%m%d_%H%M%S).txt"

{
echo "INTEGRITY CHECK ANDROID"
echo
echo "Data: $(date)"
echo
echo "Modelo: $(getprop ro.product.model)"
echo "Fabricante: $(getprop ro.product.manufacturer)"
echo "Android: $(getprop ro.build.version.release)"
echo "Kernel: $(uname -r)"
echo "Boot: $(getprop ro.boot.verifiedbootstate)"
} > "$ARQ"

echo
echo "Relatório salvo:"
echo "$ARQ"
