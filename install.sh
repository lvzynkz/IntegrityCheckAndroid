#!/data/data/com.termux/files/usr/bin/bash

clear
echo "========================================="
echo "   INSTALADOR OFICIAL - INTEGRITY CHECK"
echo "========================================="
echo

echo "[1/4] Atualizando pacotes..."
pkg update -y

echo "[2/4] Instalando dependências..."
pkg install -y bash git php python jq curl wget unzip

echo "[3/4] Dando permissão..."
chmod +x integrity.sh

echo "[4/4] Iniciando Integrity Check..."
echo

./integrity.sh
